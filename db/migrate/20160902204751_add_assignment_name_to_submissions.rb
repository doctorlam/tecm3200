class AddAssignmentNameToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :assignment_name, :string
  end
end
