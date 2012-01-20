class UsersController < ApplicationController
	#before_filter :authenticate
	#before_filter :correct_user?

	def show
		@user = User.find(params[:id])
		@selected_category = params[:c].strip
		if @user == current_user
			if params[:c] && params[:c] != "all"
				@recipes = @user.recipes.in_c(params[:c].strip) #.paginate(:page => params[:page], :per_page => 30)
			else
				@recipes = @user.recipes
			end
		else
			if params[:c] && params[:c] != "all"
				@recipes = @user.recipes.public.in_c(params[:c].strip) #.paginate(:page => params[:page], :per_page => 30)
			else
				@recipes = @user.recipes.public
			end
		end
	end

	def r_search
		@user = User.find(params[:id])
		@selected_category = params[:c].strip
		if @user == current_user
      if params[:c] && params[:c] != "all" && params[:c] != ""
        @recipes = Recipe.search(params[:search].strip).in_c(params[:c].strip).where(:user_id => @user.id) #.paginate(:page => params[:page], :per_page => 30)
      else
        @recipes = Recipe.search(params[:search].strip).where(:user_id => @user.id)
      end
    else
      if params[:c] && params[:c] != "all" && params[:c] != ""
        @recipes = Recipe.search(params[:search].strip).in_c(params[:c].strip).where(:user_id => @user.id).public #.paginate(:page => params[:page], :per_page => 30)
      else
        @recipes = Recipe.search(params[:search].strip).where(:user_id => @user.id).public
      end
    end

    respond_to do |format| 
      format.js 
    end
	end

end
