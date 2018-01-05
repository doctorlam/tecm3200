class Slidedeck < ActiveRecord::Base
	has_many :slides, :dependent => :destroy
	accepts_nested_attributes_for :slides, :allow_destroy => true

	has_many :notes
  before_validation { image.clear if @delete_image }

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end
end
