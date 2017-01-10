class AddFakeScoreToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :fake_score, :integer
  end
end
