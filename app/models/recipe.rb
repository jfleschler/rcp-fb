class Recipe
  include Mongoid::Document

  field :name,   :type => String
  field :image,  :type => String, :default => "recipe_placeholder.png"
  field :public, :type => Boolean, :default => false
  field :cook_temp,   :type => String
  field :cook_time,   :type => String
  field :temp_unit,   :type => String

  belongs_to :user

  #default_scope order_by([:id, :asc])
	scope :public, lambda { where(:public => true) }

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def temperature
		"#{cook_temp.to_s}#{temp_unit.to_s}"
	end

end
