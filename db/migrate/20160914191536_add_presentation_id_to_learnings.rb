class AddPresentationIdToLearnings < ActiveRecord::Migration
  def change
    add_column :learnings, :presentation_id, :integer
  end
end
