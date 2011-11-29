class Recipe
  include Mongoid::Document
	include Mongoid::Timestamps
  
  field :name,  			:type => String
  field :image,  			:type => String, :default => "recipe_placeholder.png"
  field :isPublic, 		:type => Boolean, :default => false
  field :cook_temp,   :type => String
  field :cook_time,   :type => String
  field :temp_unit,   :type => String
	field :makes,		    :type => String

  belongs_to :user
	has_many :steps, :dependent => :destroy

  default_scope order_by([:created_at, :asc])
	scope :public, lambda { where(:isPublic => true) }

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def temperature
		"#{cook_temp.to_s}#{temp_unit.to_s}"
	end

	def getAssociations
		myAssociations = []
		steps.each do |step|
			step.associations.each do |a|
				myAssociations << a
			end
		end
		return myAssociations
	end
end
