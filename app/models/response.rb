class Response < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  	has_attached_file :document
  		do_not_validate_attachment_file_type :document


		
			attr_accessor :delete_image
  			before_validation { image.clear if delete_image == '1' }
  	has_attached_file :document
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
