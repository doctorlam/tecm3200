class AddTutorialIdToLearnings < ActiveRecord::Migration
  def change
    add_column :learnings, :tutorial_id, :integer
  end
end
