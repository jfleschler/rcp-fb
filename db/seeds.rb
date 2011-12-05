
ingredients = [
	{:name => "salted butter",		:image => "ingredients/butter.png"},
	{:name => "unsalted butter",	:image => "ingredients/butter.png"},
	{:name => "white sugar",		:image => "placeholder.png"},
	{:name => "dark brown sugar",	:image => "placeholder.png"},
	{:name => "light brown sugar",	:image => "placeholder.png"},
	{:name => "egg",				:image => "ingredients/egg.png"},
	{:name => "egg white",			:image => "placeholder.png"},
	{:name => "vanilla extract",	:image => "ingredients/vanilla.png"},
	{:name => "all-purpose flour",	:image => "ingredients/flour.png"},
	{:name => "salt",				:image => "ingredients/salt.png"},
	{:name => "baking powder",		:image => "placeholder.png"},
	{:name => "baking soda",		:image => "placeholder.png"},
	{:name => "chocolate chips",	:image => "placeholder.png"},
	{:name => "cinnamon",			:image => "placeholder.png"},
	{:name => "milk",				:image => "placeholder.png"},
	{:name => "raisins",			:image => "placeholder.png"},
	{:name => "cake flour",			:image => "ingredients/flour.png"},
	{:name => "strawberries",		:image => "ingredients/strawberry.png"}
].each do |i|
	ingredient = Ingredient.find_or_create_by(i)
	ingredient.update_attributes(i)
	ingredient.save
end