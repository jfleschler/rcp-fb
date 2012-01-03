class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
  	user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
  	session[:user_id] = user.id

    #Update User Picture

    user.picture = user.profile.picture
    user.save
    
  	redirect_back_or root_url
  end

  def destroy
	  reset_session
	  redirect_to root_url, :notice => 'signed out!'
  end

  def new
    redirect_to '/auth/facebook'
  end

  def failure
    redirect_to root_url, :alert => "authentication error: #{params[:message].humanize}"
  end
end
