class Association
  include Mongoid::Document
  field :position,  :type => Integer
  field :amount,  	:type => String

  belongs_to :ingredient
  belongs_to :step

  before_destroy :renumber_remaining

  scope :ordered, lambda { order(:position) }
	scope :list, lambda { joins(:ingredient).where("ingredients.recipe_id is null").order(:ingredient_id) }

  def ingredient
  	Ingredient.find(ingredient_id)
  end

	private

		def renumber_remaining
		  step = Step.find(step_id)
		  step.associations.each do |a|
			if(a.position > position)
	  		  a.position = a.position - 1
			  a.save
			end
		  end
	  	end
end