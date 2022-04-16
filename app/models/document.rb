class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader

  validates :title, :attachment, presence: true
  has_shortened_urls
  after_create :set_shortened_url

  private

  def set_shortened_url
    Shortener::ShortenedUrl.generate("http://localhost:3000/", owner: self)
  end
end
