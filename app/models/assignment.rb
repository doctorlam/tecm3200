class Assignment < ActiveRecord::Base
	
	has_many :users
	belongs_to :user
	has_many :submissions, :dependent => :destroy
	has_many :learnings
	has_many :lessons, :through => :learnings

end
