class AddAttachmentDocumentToResponses < ActiveRecord::Migration
  def self.up
    change_table :responses do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :responses, :document
  end
end
