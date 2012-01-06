class UsersController < ApplicationController
	#before_filter :authenticate
	#before_filter :correct_user?

	def show
		@user = User.find(params[:id])
		if @user == current_user
			@recipes = @user.recipes #.paginate(:page => params[:page], :per_page => 30)
		else
			@recipes = @user.recipes.public #.paginate(:page => params[:page], :per_page => 30)
		end
	end

end
