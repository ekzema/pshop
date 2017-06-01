json.extract! product, :id, :twocategory_id, :name, :description, :price, :visible, :meta_desc, :meta_key, :created_at, :updated_at
json.url product_url(product, format: :json)
