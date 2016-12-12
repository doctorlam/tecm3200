class Submission < ActiveRecord::Base

	belongs_to :assignment
	belongs_to :creator, class_name: "User"
	belongs_to :student, class_name: "User"

	has_attached_file :document
		do_not_validate_attachment_file_type :document

  	has_attached_file :image
  		do_not_validate_attachment_file_type :image

  		
end