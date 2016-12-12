class Grade < ActiveRecord::Base

	has_many :gradecategories
	accepts_nested_attributes_for :gradecategories, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true


	has_many :gradecategorizations 
	has_many :submissions, :through => :gradecategorizations
end
