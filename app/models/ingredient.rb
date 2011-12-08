class Ingredient
  include Mongoid::Document

  field :name,   		:type => String
  field :image,  		:type => String
  field :user_id,		:type => Integer
  field :recipe_id, :type => Integer

  before_destroy :destroy_associations

  has_many :associations
	
	scope :non_user, lambda { where("recipe_id is null").order(:ingredient_id) }
	
  def self.search(search)
	  if search
	  	Ingredient.all(conditions: { name: /#{search}/i })
	  else
	    Ingredient.find(:all)
	  end
	end

	private
		
		def destroy_associations
			associations.each do |a|
				a.destroy
			end
		end
end