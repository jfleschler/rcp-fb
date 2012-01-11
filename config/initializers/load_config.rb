APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))[Rails.env]

RECIPE_CATEGORIES = APP_CONFIG['categories']

