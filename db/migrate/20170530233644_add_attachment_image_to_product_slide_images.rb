class AddAttachmentImageToProductSlideImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :product_slide_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :product_slide_images, :image
  end
end
