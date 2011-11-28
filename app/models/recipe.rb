class Recipe
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String, :default => "recipe_placeholder.png"
  field :public, :type => Boolean, :default => false
  field :cook_temp,   :type => String
  field :cook_time,   :type => String
  field :cook_unit,   :type => String

  belongs_to :user

  default_scope order(:id)
	scope :public, lambda { where(:public => true) }

	before_destroy :remove_ingredient

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def temperature
		"#{cook_temp.to_s}#{temp_unit.to_s}"
	end

	def remove_ingredient
		unless has_ingredient == nil
			i = Ingredient.find(has_ingredient)
			i.destroy
		end
	end

	def recipes_as_ingredients
		r_as_i = []
		associations.each do |a|
			unless a.ingredient.recipe_id.nil?
				r_as_i << Recipe.find_by_id(a.ingredient.recipe_id)
			end
		end
		return r_as_i
	end
end
