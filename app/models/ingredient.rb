class Ingredient
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String

  has_many :associations, :dependent => :destroy
end