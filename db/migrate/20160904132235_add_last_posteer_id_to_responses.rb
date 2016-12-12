class AddLastPosteerIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :last_poster_id, :integer
  end
end
