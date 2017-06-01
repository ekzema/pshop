class AddAttachmentImageToTwocategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :twocategories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :twocategories, :image
  end
end
