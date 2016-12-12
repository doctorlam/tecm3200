class AddUserIdToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :user_id, :integer
  end
end
