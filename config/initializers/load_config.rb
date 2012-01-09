APP_CONFIG = APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))[Rails.env]

RECIPE_CATEGORIES = APP_CONFIG['categories']

Recipe.each do |r|
	r.in_category = r.category
	r.save
end