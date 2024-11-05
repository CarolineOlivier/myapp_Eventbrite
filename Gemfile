source "https://rubygems.org"

# Rails est le framework principal pour créer des applications web en Ruby.
gem "rails", "~> 7.2.1", ">= 7.2.1.2"

# sprockets-rails permet de gérer et de servir des fichiers d'assets (CSS, JS, images) dans les applications Rails.
gem "sprockets-rails"

# pg est l'adaptateur PostgreSQL, utilisé pour connecter Rails à une base de données PostgreSQL.
gem "pg", "~> 1.1"

# Puma est un serveur d'applications rapide et léger pour exécuter des applications Rails en production.
gem "puma", ">= 5.0"

# importmap-rails permet d'importer et de gérer les fichiers JavaScript en utilisant les import maps au lieu de Webpacker.
gem "importmap-rails"

# turbo-rails fait partie de Hotwire et permet de créer des applications à page unique (SPA) sans utiliser trop de JavaScript.
gem "turbo-rails"

# stimulus-rails est le framework JavaScript léger de Hotwire pour ajouter des comportements interactifs aux pages.
gem "stimulus-rails"

# jbuilder aide à générer des réponses JSON pour les API.
gem "jbuilder"

# dotenv-rails permet de gérer les variables d'environnement dans un fichier `.env` pour stocker des informations sensibles.
gem 'dotenv-rails'

# bcrypt est utilisé pour hacher et sécuriser les mots de passe des utilisateurs.
#gem "bcrypt", "~> 3.1.7"

# devise est un outil pour ajouter des fonctionnalités d'authentification utilisateur (création de comptes, connexion).
gem 'devise'

# tzinfo-data est nécessaire pour inclure les fichiers de fuseaux horaires sur Windows et Jruby.
gem "tzinfo-data", platforms: %i[ windows jruby ]

# bootsnap accélère le temps de démarrage de l'application en utilisant un cache.
gem "bootsnap", require: false

group :development, :test do
  # debug est un outil de débogage pour Ruby, permettant d'examiner et corriger des erreurs dans l'application.
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # brakeman est un outil de sécurité qui analyse le code pour détecter les vulnérabilités.
  gem "brakeman", require: false

  # rubocop-rails-omakase est un outil de style pour Ruby qui impose des conventions de style de code.
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # web-console permet d'exécuter des commandes Rails directement dans le navigateur lors d'une erreur (utile pour le débogage).
  gem "web-console"
end

group :test do
  # capybara est un outil de test pour simuler les interactions de l'utilisateur sur l'interface.
  gem "capybara"

  # selenium-webdriver est utilisé par Capybara pour contrôler le navigateur lors des tests.
  gem "selenium-webdriver"
end

# dockerfile-rails aide à intégrer Docker dans un projet Rails, pour faciliter l'exécution et le déploiement.
gem "dockerfile-rails", ">= 1.6", :group => :development




