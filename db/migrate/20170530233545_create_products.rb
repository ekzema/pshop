class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :twocategory_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :visible, default: 0
      t.integer :new, default: 0
      t.integer :share, default: 0
      t.integer :share_price
      t.text :meta_desc
      t.text :meta_key

      t.timestamps
    end
  end
end
