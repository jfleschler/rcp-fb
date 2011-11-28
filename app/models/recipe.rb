class Recipe
  include Mongoid::Document

  field :name,  :type => String
  field :image, :type => String, :default => "recipe_placeholder.png"

  belongs_to :user
end