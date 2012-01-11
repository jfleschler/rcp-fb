APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))[Rails.env]

RECIPE_CATEGORIES = APP_CONFIG['categories']

Recipe.all.each do |r|
	r.filter_category = r.my_category
	r.save
end