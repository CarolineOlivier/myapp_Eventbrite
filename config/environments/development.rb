require "active_support/core_ext/integer/time"
# Charge les extensions d'ActiveSupport pour la manipulation des durées.

Rails.application.configure do
  # Les paramètres définis ici remplaceront ceux dans config/application.rb.

  # Recharge le code de l'application à chaque modification.
  # Cela ralentit le temps de réponse mais est parfait pour le développement,
  # car il n'est pas nécessaire de redémarrer le serveur lors de changements de code.
  config.enable_reloading = true

  # N'active pas le chargement anticipé du code au démarrage (économise de la mémoire).
  config.eager_load = false

  # Affiche les rapports d'erreurs complets dans le navigateur.
  config.consider_all_requests_local = true

  # Active les statistiques de serveur pour mesurer le temps de traitement.
  config.server_timing = true

  # Active ou désactive la mise en cache. Par défaut, le cache est désactivé.
  # Exécute `rails dev:cache` pour activer ou désactiver le cache.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    # Active la mise en cache pour les contrôleurs si le fichier `caching-dev.txt` existe.
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    # Utilise la mémoire pour stocker les données en cache.
    config.cache_store = :memory_store
    # Définit les en-têtes HTTP pour les fichiers publics en cache.
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.to_i}" }
  else
    # Désactive la mise en cache pour les contrôleurs si `caching-dev.txt` n'existe pas.
    config.action_controller.perform_caching = false
    # Utilise un stockage nul (pas de cache).
    config.cache_store = :null_store
  end

  # Stocke les fichiers téléchargés sur le système de fichiers local (voir config/storage.yml pour les options).
  config.active_storage.service = :local

  # Ne soulève pas d'erreur si le mailer ne parvient pas à envoyer un e-mail.
  config.action_mailer.raise_delivery_errors = false

  # Désactive la mise en cache pour les templates de mails même si le cache du contrôleur est activé.
  config.action_mailer.perform_caching = false

  # Définit l'URL de base utilisée dans les liens d'e-mails en développement.
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Définit `letter_opener` comme méthode de livraison des e-mails en développement.
  # Cela ouvre les e-mails dans le navigateur au lieu de les envoyer réellement,
  # pratique pour tester l'apparence et le contenu des e-mails.
  config.action_mailer.delivery_method = :letter_opener

  # Active l'envoi effectif des e-mails en développement.
  # Si cette option est sur `false`, aucun e-mail ne sera généré ni affiché.
  config.action_mailer.perform_deliveries = true

  # Affiche les notifications de dépréciation dans le journal Rails.
  config.active_support.deprecation = :log

  # Soulève des exceptions pour les dépréciations non autorisées.
  config.active_support.disallowed_deprecation = :raise

  # Indique à Active Support quelles dépréciations désactiver.
  config.active_support.disallowed_deprecation_warnings = []

  # Soulève une erreur si des migrations sont en attente lors du chargement de la page.
  config.active_record.migration_error = :page_load

  # Met en évidence dans les logs le code qui déclenche les requêtes à la base de données.
  config.active_record.verbose_query_logs = true

  # Met en évidence dans les logs le code qui a mis en file d'attente un job de fond.
  config.active_job.verbose_enqueue_logs = true

  # Supprime les sorties de log pour les requêtes d'assets (CSS, JS).
  config.assets.quiet = true

  # Soulève une erreur si une traduction est manquante.
  # config.i18n.raise_on_missing_translations = true

  # Annote les vues rendues avec les noms de fichiers pour faciliter le débogage.
  config.action_view.annotate_rendered_view_with_filenames = true

  # Autorise l'accès à Action Cable depuis n'importe quelle origine (à décommenter si nécessaire).
  # config.action_cable.disable_request_forgery_protection = true

  # Soulève une erreur lorsqu'un before_action `only/except` fait référence à des actions manquantes.
  config.action_controller.raise_on_missing_callback_actions = true

  # Applique automatiquement les corrections de RuboCop aux fichiers générés par `bin/rails generate`.
  # config.generators.apply_rubocop_autocorrect_after_generate!

  # Définit l'URL par défaut pour les liens d'e-mail en développement.
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
