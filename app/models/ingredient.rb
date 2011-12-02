class Ingredient
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String

  has_many :associations, :dependent => :destroy

  def self.search(search)
	  if search
	  	find( { name : /#{search}/i } )
	  else
	    find({}})
	  end
	end
end