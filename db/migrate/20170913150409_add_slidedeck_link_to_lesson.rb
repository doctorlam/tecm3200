class AddSlidedeckLinkToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :slidedeck_link, :string
  end
end
