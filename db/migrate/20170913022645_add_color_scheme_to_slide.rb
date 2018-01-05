class AddColorSchemeToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :color_scheme, :text
  end
end
