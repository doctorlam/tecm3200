class Tutorial < ActiveRecord::Base
	has_many :learnings
	has_many :lessons, :through => :learnings
	belongs_to :user
	has_attached_file :attachment
		do_not_validate_attachment_file_type :attachment
end
