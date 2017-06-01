class CreateSiteSlideImages < ActiveRecord::Migration[5.1]
  def change
    create_table :site_slide_images do |t|

      t.timestamps
    end
  end
end
