module RecipesHelper

	def new_step
		nextNum = @recipe.steps.count + 1
		@recipe.steps.create({:step_num => nextNum})
	end

	def new_step_button(recipe)
		button_to "new step", new_recipe_step_path(recipe), :class => 'btn primary', :method => 'get', :remote => true
	end

	def public_private_button(recipe)
		if recipe.public?
			link_to "public", url_for(:controller => 'recipes', :action => 'toggle', :toggle => true, :user_id => @user, :id => recipe), :method => 'put', :remote => true, :class => "btn small info" 
		else 
			link_to "private", url_for(:controller => 'recipes', :action => 'toggle', :toggle => true, :user_id => @user, :id => recipe), :method => 'put', :remote => true, :class => "btn small danger" 
		end
	end

	def create_remove_ingredient_button(recipe)
		if recipe.has_ingredient == nil
			link_to "create ingredient", url_for(:controller => 'recipes', :action => 'create_ingredient', :user_id => current_user, :id => recipe), :method => 'put', :remote => true, :class => "btn info" 
		else 
			link_to "remove ingredient", url_for(:controller => 'recipes', :action => 'remove_ingredient', :user_id => current_user, :id => recipe), :method => 'put', :remote => true, :class => "btn danger" 
		end
	end

	def is_last?(recipe, last)
		if recipe == last
			"last"
		end
	end
end
