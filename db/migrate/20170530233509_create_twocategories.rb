class CreateTwocategories < ActiveRecord::Migration[5.1]
  def change
    create_table :twocategories do |t|
      t.integer :category_id
      t.string :name
      t.text :meta_desc
      t.text :meta_key

      t.timestamps
    end
  end
end
