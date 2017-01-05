class Assignment < ActiveRecord::Base
	has_many :portals
	has_many :submissions, :through => :portals
	has_many :homeworks, :through => :turnins
	has_many :learnings
	has_many :lessons, :through => :learnings
end
