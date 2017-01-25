class AddAssignmentTypeToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :assignment_type, :string
  end
end
