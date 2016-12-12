class AddCreatorIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :creator_id, :integer
  end
end
