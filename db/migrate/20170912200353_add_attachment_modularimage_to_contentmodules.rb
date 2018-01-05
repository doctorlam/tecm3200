class AddAttachmentModularimageToContentmodules < ActiveRecord::Migration
  def self.up
    change_table :contentmodules do |t|
      t.attachment :modularimage
    end
  end

  def self.down
    remove_attachment :contentmodules, :modularimage
  end
end
