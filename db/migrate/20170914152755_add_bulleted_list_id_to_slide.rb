class AddBulletedListIdToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :bulleted_list_id, :integer
  end
end
