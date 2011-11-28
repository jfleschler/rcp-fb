module ApplicationHelper
	def fb_login_btn
		img = image_tag "facebook.png", :id => "facebook_image"
		link_to img + " log in", signin_path
	end
end
