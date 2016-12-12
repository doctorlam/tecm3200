class AddAttachmentDocumentToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :abouts, :document
  end
end
