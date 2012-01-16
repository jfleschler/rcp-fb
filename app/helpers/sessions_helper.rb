module SessionsHelper

	def sign_in!(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
	end
	
	def sign_out
    	cookies.delete(:remember_token)
    	self.current_user = nil
  	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
	  	begin
     	   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    	rescue Mongoid::Errors::DocumentNotFound
    	   nil
    	end
	end

	def signed_in?
    	!current_user.nil?
  	end

	def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "access denied."
      end
    end

	def authenticate
	    deny_access unless signed_in?
	end

	def deny_access
		store_location
		redirect_to signin_path, :notice => "please sign in."
	end

	def redirect_back_or(default)
  		redirect_to(session[:return_to] || default)
    	clear_return_to
  	end

	private
		def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
