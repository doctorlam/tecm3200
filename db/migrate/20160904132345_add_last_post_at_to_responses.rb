class AddLastPostAtToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :last_post_at, :time
  end
end
