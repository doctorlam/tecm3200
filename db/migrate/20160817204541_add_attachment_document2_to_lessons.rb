class AddAttachmentDocument2ToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :document2
    end
  end

  def self.down
    remove_attachment :lessons, :document2
  end
end
