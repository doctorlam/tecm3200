class AddAttachmentBgimageToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :bgimage
    end
  end

  def self.down
    remove_attachment :slides, :bgimage
  end
end
