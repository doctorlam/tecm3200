class AddAboutIdToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :about_id, :integer
  end
end
