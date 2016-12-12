class AddAttachmentDocumentToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :lessons, :document
  end
end
