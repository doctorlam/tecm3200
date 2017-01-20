class AddTutorialIdToClassactivities < ActiveRecord::Migration
  def change
    add_column :classactivities, :tutorial_id, :integer
  end
end
