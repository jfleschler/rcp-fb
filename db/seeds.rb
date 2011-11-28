
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

ingredients = [
	{:name => "salted butter",		:image => "ingredients/butter.png",		:tag_name => ""},
	{:name => "unsalted butter",	:image => "ingredients/butter.png",		:tag_name => ""},
	{:name => "white sugar",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "dark brown sugar",	:image => "placeholder.png",			:tag_name => ""},
	{:name => "light brown sugar",	:image => "placeholder.png",			:tag_name => ""},
	{:name => "egg",				:image => "ingredients/egg.png",		:tag_name => ""},
	{:name => "egg white",			:image => "placeholder.png",			:tag_name => ""},
	{:name => "vanilla extract",	:image => "ingredients/vanilla.png",	:tag_name => ""},
	{:name => "all-purpose flour",	:image => "ingredients/flour.png",		:tag_name => ""},
	{:name => "salt",				:image => "ingredients/salt.png",		:tag_name => ""},
	{:name => "baking powder",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "baking soda",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "chocolate chips",	:image => "placeholder.png",			:tag_name => "chocolate"},
	{:name => "cinnamon",			:image => "placeholder.png",			:tag_name => "cinnamon"},
	{:name => "milk",				:image => "placeholder.png",			:tag_name => ""},
	{:name => "raisins",			:image => "placeholder.png",			:tag_name => "raisins"},
	{:name => "cake flour",			:image => "ingredients/flour.png",		:tag_name => ""},
	{:name => "strawberries",		:image => "ingredients/strawberry.png",	:tag_name => ""}
].each do |i|
	ingredient = Ingredient.find_or_create_by_name(i)
	ingredient.update_attributes(i)
	ingredient.save
end