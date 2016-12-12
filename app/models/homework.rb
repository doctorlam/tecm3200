class Homework < ActiveRecord::Base
		belongs_to :lesson
		has_many :turnins
		has_many :assignments, :through => :turnins
end
