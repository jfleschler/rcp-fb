module UsersHelper
	def mine_or_theirs(user)
		if user == current_user
			"my"
		else
			"#{@user.username}'s"
		end
	end
end
