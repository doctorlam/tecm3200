class AddAboutIdToCourseInfo < ActiveRecord::Migration
  def change
    add_column :course_infos, :about_id, :integer
  end
end
