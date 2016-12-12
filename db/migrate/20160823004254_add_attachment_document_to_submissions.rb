class AddAttachmentDocumentToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :submissions, :document
  end
end
