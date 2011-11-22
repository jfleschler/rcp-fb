class HomeController < ApplicationController
  def index
  	User.all.each do |user|
  		@users << FbGraph::User.new(user.uid, :access_token => user.access_token)
  	end
  end

end
