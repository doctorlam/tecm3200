class AddSlidedeckIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :slidedeck_id, :integer
  end
end
