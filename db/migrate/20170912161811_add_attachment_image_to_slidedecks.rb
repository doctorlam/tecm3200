class AddAttachmentImageToSlidedecks < ActiveRecord::Migration
  def self.up
    change_table :slidedecks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :slidedecks, :image
  end
end
