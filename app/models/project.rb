class Project < ActiveRecord::Base
	belongs_to :course
	has_many :learnings
	has_many :lessons, :through => :learnings
	has_many :deliverables, :dependent => :destroy
	has_many :rubrics, :dependent => :destroy
	has_many :related, :dependent => :destroy
	belongs_to :user

	accepts_nested_attributes_for :deliverables, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :rubrics, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :related, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
    default_scope { order('name') } 

end
