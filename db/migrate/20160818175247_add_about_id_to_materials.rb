class AddAboutIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :about_id, :integer
  end
end
