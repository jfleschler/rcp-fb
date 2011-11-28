module UsersHelper
	def mine_or_theirs(user)
		if user == current_user
			"my"
		else
			"#{@user.name}'s"
		end
	end
end
