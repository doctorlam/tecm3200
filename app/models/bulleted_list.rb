class BulletedList < ActiveRecord::Base
  belongs_to :slide

  has_many :bullets, :dependent => :destroy
  	accepts_nested_attributes_for :bullets, :reject_if => lambda { |a| a[:list_item].blank? }, :allow_destroy => true

end
