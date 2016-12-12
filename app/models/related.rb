class Related < ActiveRecord::Base
	belongs_to :project
	has_many :lessons, :dependent => :destroy
end
