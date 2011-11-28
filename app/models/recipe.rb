class Recipe
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String, :default => "recipe_placeholder.png"
  field :public, :type => Boolean, :default => false
  field :cook_temp,   :type => String
  field :cook_time,   :type => String
  field :cook_unit,   :type => String

  belongs_to :user
end