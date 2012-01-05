APP_CONFIG = APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))

RECIPE_CATEGORIES = APP_CONFIG[categories]