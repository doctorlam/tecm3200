class AddPresentationIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :presentation_id, :integer
  end
end
