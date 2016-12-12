class Attachment < ActiveRecord::Base
	belongs_to :lesson
	has_attached_file :attachment
end
