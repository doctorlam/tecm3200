class AddAssignmentIdToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :assignment_id, :integer
  end
end
