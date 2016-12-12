class AddAboutIdToVitals < ActiveRecord::Migration
  def change
    add_column :vitals, :about_id, :integer
  end
end
