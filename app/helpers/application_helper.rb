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
end
