class Tutorial < ActiveRecord::Base
	has_many :learnings
	has_many :lessons, :through => :learnings
	belongs_to :user
	has_many :objectives, :dependent => :destroy
	has_many :classactivitys, :dependent => :destroy

	has_attached_file :attachment
	do_not_validate_attachment_file_type :attachment

	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :classactivitys, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
