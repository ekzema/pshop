class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :meta_desc
      t.text :meta_key
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
