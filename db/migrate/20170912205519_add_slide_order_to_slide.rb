class AddSlideOrderToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :slide_order, :integer
  end
end
