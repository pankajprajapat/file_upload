json.extract! document, :id, :user_id, :title, :description, :attachment, :created_at, :updated_at
json.url document_url(document, format: :json)
