class AddTotalscoreToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :totalscore, :integer
  end
end
