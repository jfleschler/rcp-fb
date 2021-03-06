class Recipe
  include Mongoid::Document
	include Mongoid::Timestamps
  
  field :name,  					:type => String
  field :image,  					:type => String,  :default => "recipe_placeholder.png"
  field :isPublic, 				:type => Boolean, :default => false
  field :cook_temp,   		:type => String
  field :cook_time,   		:type => String
  field :temp_unit,  			:type => String
	field :makes,		    		:type => String
	field :has_ingredient,	:type => String
	field :my_category,			:type => String
	field :filter_category, :type => String
	field :tags,						:type => String

  belongs_to :user
	has_many :steps, :dependent => :destroy

	mount_uploader :image, ImageUploader

  default_scope order_by([:name, :asc])
	scope :public, -> { where(:isPublic => true) }

	def self.in_c(myCategory)
  	Recipe.where( :my_category.all => [myCategory] )
	end

	def self.in_t(myTag)
  	Recipe.all( conditions: { tags: /#{myTag}/i } )
	end

  def self.search(search)
	  if search
	  	Recipe.any_of( { name: /#{search}/i }, { tags: /#{search}/i } )
	  else
	    Recipe.find(:all)
	  end
	end

	def self.u_search(uid, search)
	  if search
	  	Recipe.any_of( { name: /#{search}/i }, { tags: /#{search}/i } ).where(:user_id => uid)
	  else
	    Recipe.find(:all).where(:user_id => uid)
	  end
	end

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

	def remove_ingredient
		unless has_ingredient == nil
			i = Ingredient.find(has_ingredient)
			i.destroy
		end
	end

	def recipes_as_ingredients
		r_as_i = []
		getAssociations.each do |a|
			unless a.ingredient.recipe_id.nil?
				r_as_i << Recipe.find(a.ingredient.recipe_id)
			end
		end
		return r_as_i
	end
end
