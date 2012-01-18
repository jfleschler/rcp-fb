module ApplicationHelper
	def fb_login_btn
		img = image_tag "facebook.png", :id => "facebook_image"
		link_to img + " log in", signin_path
	end

	def new_ingredient_img_tag(step)
		image_tag 'newIngredient.png', :class => 'newIngredient', :id => step.id
	end

	def delete_step_tag(recipe, step)
		link_to "delete", recipe_step_path(recipe, step), :confirm => "Are you sure?", :method => :delete, :remote => true
	end

	def delete_association_tag(recipe, step, association)
		link_to (image_tag 'redx.png'), recipe_step_association_path(recipe, step, association), :confirm => "Are you sure?", :method => :delete, :remote => true
	end

	def recipe_image_or_placeholder(recipe)
		unless recipe.image_url(:preview).nil?
	 		image_tag recipe.image_url(:preview), :size => "150x150"
		else
			image_tag 'recipe_placeholder.png', :size => "150x150" 
		end
	end


	def spiral_y(i)
		pi = 3.14159265358979
		e = 2.718281828
		cY = 5000 / 2
		a = 1
		b = 1

		ang = (pi / 720) * i
		y = cY + (a * (Math.sin(ang)) * (e ** (b * ang)))
		
	end

	def spiral_x(i)
		pi = 3.14159265358979
		e = 2.718281828
		cX = 5000 / 2
		a = 1
		b = 1

		ang = (pi / 720) * i
		x = cX + (a * (Math.cos(ang)) * (e ** (b * ang)))
	end
end
