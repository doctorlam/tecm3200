class AddBgcolorToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :bgcolor, :string
  end
end
