class Learning < ActiveRecord::Base
	belongs_to :lesson
	belongs_to :project
	belongs_to :assignment
	belongs_to :presentation
end
