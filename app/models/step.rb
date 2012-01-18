class Step
  include Mongoid::Document
  field :step_num,  :type => Integer
  field :note,  		:type => String

  belongs_to :recipe
  has_many :associations, :dependent => :destroy
  #has_many :ingredients, :through => :associations

  before_destroy :renumber_remaining

  scope :ordered, lambda { order_by([:step_num, :asc]) }

	def number_string
		case step_num
			when 1 
				"q"
			when 2 
				"w"
			when 3 
				"e"
			when 4 
				"r"
			when 5 
				"t"
			when 6 
				"y"
			when 7 
				"u"
			when 8 
				"i"
			when 9 
				"o"
			when 10	
				"a"
			when 11	
				"s"
			when 12	
				"d"
			when 13	
				"f"
			when 14	
				"g"
			when 15	
				"h"
			when 16	
				"j"
			when 17	
				"k"
			when 18	
				"l"
			when 19	
				";"
		end
	end

	private
		
		def renumber_remaining
			recipe = Recipe.find(recipe_id)
			recipe.steps.each do |s|
				if(s.step_num > step_num)
					s.step_num = s.step_num - 1
					s.save
				end
			end
		end

end
