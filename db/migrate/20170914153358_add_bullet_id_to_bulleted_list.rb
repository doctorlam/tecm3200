class AddBulletIdToBulletedList < ActiveRecord::Migration
  def change
    add_column :bulleted_lists, :bullet_id, :integer
  end
end
