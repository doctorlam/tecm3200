class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :slidedeck, :required => false 
end
