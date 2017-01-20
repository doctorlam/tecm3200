class Objective < ActiveRecord::Base
	belongs_to :lesson
	belongs_to :about
	belongs_to :tutorial
end
