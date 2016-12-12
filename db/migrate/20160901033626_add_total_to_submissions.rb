class AddTotalToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :total, :string
  end
end
