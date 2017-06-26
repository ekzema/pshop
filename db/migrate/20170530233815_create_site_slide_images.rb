class CreateSiteSlideImages < ActiveRecord::Migration[5.1]
  def change
    create_table :site_slide_images do |t|
      t.integer :site_setting_id
      # t.references :site_setting, foreign_key: true
      t.timestamps
    end
  end
end
