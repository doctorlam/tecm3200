class Turnin < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :homework
end
