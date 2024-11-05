require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.2

    # Définit le français comme langue par défaut
    config.i18n.default_locale = :fr

    # Charge toutes les traductions dans le dossier config/locales
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]

    config.autoload_lib(ignore: %w[assets tasks])
    
    # Configuration supplémentaire si besoin...
  end
end
