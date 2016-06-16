require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module CreativeFlashExample
  class Application < Rails::Application
    config.generators.assets = false
    config.generators.helper = false
    config.i18n.default_locale = "en"

    config.time_zone = 'Riga'
    config.autoload_paths += Dir["#{Rails.root}/app/models/concerns/**/*.rb"]
    config.autoload_paths += Dir["#{Rails.root}/app/controllers/concerns/**/*.rb"]
    config.autoload_paths += Dir["#{Rails.root}/app/lib/**/*.rb"]
    config.autoload_paths += Dir["#{Rails.root}/app/jobs/**/*.rb"]

    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.yml"]
  end
end
