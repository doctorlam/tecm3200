class Assignment < ActiveRecord::Base
	has_many :portals
	has_many :submissions, :through => :portals
	has_many :homeworks, :through => :turnins
	has_many :learnings
	has_many :lessons, :through => :learnings
	has_attached_file :attachment
		do_not_validate_attachment_file_type :attachment

		attr_accessor :delete_document

		    before_validation { attachment.clear if delete_document == '1' }
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
