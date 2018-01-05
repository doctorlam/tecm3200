class Slide < ActiveRecord::Base
 
  before_validation { image.clear if @delete_image }

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end

  belongs_to :slidedeck
  has_many :contentmodules, -> { order("created_at ASC") }, :dependent => :destroy
  	accepts_nested_attributes_for :contentmodules, :reject_if => lambda { |a| a[:modular_content].blank? }, :allow_destroy => true

  has_many :bulleted_lists, :dependent => :destroy
  accepts_nested_attributes_for :bulleted_lists, :reject_if => lambda { |a| a[:list].blank? }, :allow_destroy => true


  has_attached_file :image, :allow_destroy => true, :styles => { :medium => "150x150>", :thumb => "100x100" }
      do_not_validate_attachment_file_type :image
 

  has_attached_file :bgimage, :styles => { :medium => "150x150>", :thumb => "50x50" }
  validates_attachment_content_type :bgimage, :content_type => /\Aimage\/.*\Z/
 
  validates :slide_order, :presence => true  #or you can also write as 'validates_presence_of :username'

       

end
