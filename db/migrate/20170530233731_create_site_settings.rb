class CreateSiteSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_settings do |t|
      t.string :meta_title
      t.text :meta_desc
      t.text :meta_key
      t.integer :comment_visible
      t.integer :sliders_visible

      t.timestamps
    end
  end
end
