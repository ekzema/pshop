class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :twocategory_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :visible
      t.text :meta_desc
      t.text :meta_key

      t.timestamps
    end
  end
end
