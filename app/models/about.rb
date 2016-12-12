class About < ActiveRecord::Base
	has_many :vitals, :dependent => :destroy
	has_many :materials, :dependent => :destroy
	has_many :objectives, :dependent => :destroy

	accepts_nested_attributes_for :vitals, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :materials, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	belongs_to :user

	has_attached_file :document
  	validates_attachment_file_name :document, :matches => [/pdf\Z/, /pptx\Z/, /docx\Z/]
	

end
