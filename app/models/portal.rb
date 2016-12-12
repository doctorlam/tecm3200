class Portal < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :submission
end
