class Ingredient
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String

  has_many :associations, :dependent => :destroy

  def self.search(search)
	  if search
	  	Ingredient.find(:all, :conditions => {:name => /#{search}/i})
	  else
	    Ingredient.find(:all)
	  end
	end
end