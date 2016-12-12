class AddAttachmentAnotherdocumentToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :anotherdocument
    end
  end

  def self.down
    remove_attachment :lessons, :anotherdocument
  end
end
