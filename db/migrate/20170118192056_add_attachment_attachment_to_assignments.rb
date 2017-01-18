class AddAttachmentAttachmentToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :assignments, :attachment
  end
end
