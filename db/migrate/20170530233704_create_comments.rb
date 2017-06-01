class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.string :name
      t.string :email
      t.string :phone
      t.text :body
      t.integer :moderation

      t.timestamps
    end
  end
end
