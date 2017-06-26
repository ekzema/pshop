class CreateSiteSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_settings do |t|
      t.string :meta_title
      t.text :meta_desc
      t.text :meta_key
      t.integer :comment_visible, default: 1
      t.integer :sliders_visible, default: 1

      t.timestamps
    end
    if SiteSetting.count == 0
      SiteSetting.create
    end
  end
 
end


