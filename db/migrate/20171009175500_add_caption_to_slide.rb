class AddCaptionToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :caption, :text
  end
end
