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
	
  	attr_accessor :delete_document

		    before_validation { document.clear if delete_document == '1' }
		 module DeletableAttachment
		  extend ActiveSupport::Concern

		  included do
		    attachment_definitions.keys.each do |name|

		      attr_accessor :"delete_#{name}"
		      attr_accessible :"delete_#{name}"
		      
		      before_validation { send(name).clear if send("delete_#{name}") == '1' }

		      define_method :"delete_#{name}=" do |value|
		        instance_variable_set :"@delete_#{name}", value
		        send("#{name}_file_name_will_change!")
		      end

		    end
		  end

		end
end
