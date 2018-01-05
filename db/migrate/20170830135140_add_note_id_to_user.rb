class AddNoteIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :note_id, :integer
  end
end
