class AddInstructorIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :instructor_id, :integer
  end
end
