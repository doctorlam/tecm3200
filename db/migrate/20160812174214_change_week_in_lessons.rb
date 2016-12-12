class ChangeWeekInLessons < ActiveRecord::Migration
  def self.up
    change_column :lessons, :week, :integer
  end
 
  def self.down
    change_column :lessons, :week, :decimal
  end
end
