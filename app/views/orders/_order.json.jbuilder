json.extract! order, :id, :name, :address, :email, :pay_type, :phone, :city, :delivery, :note, :created_at, :updated_at
json.url order_url(order, format: :json)