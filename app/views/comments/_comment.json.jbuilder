json.extract! comment, :id, :product_id, :name, :email, :phone, :body, :moderation, :created_at, :updated_at
json.url comment_url(comment, format: :json)
