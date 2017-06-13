class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type
      t.text :phone
      t.string :city
      t.string :delivery
      t.text :note
      t.integer :moderation

      t.timestamps
    end
  end
end
