class AddContentmoduleIdToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :contentmodule_id, :integer
  end
end
