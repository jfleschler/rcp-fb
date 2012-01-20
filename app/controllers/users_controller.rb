class UsersController < ApplicationController
	#before_filter :authenticate
	#before_filter :correct_user?

	def show
		@user = User.find(params[:id])
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
		if @user == current_user
      if params[:c] && params[:c] != "all" && params[:c] != ""
        @recipes = @user.recipes.search(params[:search].strip).in_c(params[:c].strip) #.paginate(:page => params[:page], :per_page => 30)
      else
        @recipes = @user.recipes
      end
    else
      if params[:c] && params[:c] != "all" && params[:c] != ""
        @recipes = @user.recipes.search(params[:search].strip).in_c(params[:c].strip).public #.paginate(:page => params[:page], :per_page => 30)
      else
        @recipes = @user.recipes.search(params[:search].strip).public
      end
    end

    respond_to do |format| 
      format.js 
    end
	end

end
