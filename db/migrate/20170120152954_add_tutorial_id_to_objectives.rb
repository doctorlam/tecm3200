class AddTutorialIdToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :tutorial_id, :integer
  end
end
