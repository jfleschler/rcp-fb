APP_CONFIG = APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))[Rails.env]

RECIPE_CATEGORIES = APP_CONFIG['categories']

Recipe.all.each do |r|
	if r.category.nil? || r.category == ""
		r.category = 'Uncategorized'
		r.save
	end
end