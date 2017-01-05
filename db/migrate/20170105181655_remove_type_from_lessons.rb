class RemoveTypeFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :type, :string
  end
end
