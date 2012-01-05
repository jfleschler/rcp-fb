APP_CONFIG = APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))['production']

RECIPE_CATEGORIES = APP_CONFIG['categories'][1]