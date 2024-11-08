Rails.application.routes.draw do
  # Routes de vérification de santé de l'application
  get "up" => "rails/health#show", as: :rails_health_check
  # Route "up" pour vérifier la santé de l'application. Elle renvoie un code 200 si tout fonctionne correctement,
  # ou un code 500 en cas d'erreurs. Utile pour les outils de monitoring pour s'assurer que l'application est opérationnelle.

  # Routes dynamiques pour la Progressive Web App (PWA) /les fichiers dynamiques PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # Route pour servir le service worker de la PWA. Le service worker est un fichier JavaScript qui permet de gérer le
  # cache et les notifications pour améliorer l'expérience utilisateur, même hors ligne.

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Route pour servir le manifest de la PWA. Le manifest est un fichier JSON qui contient des métadonnées sur l'application,
  # comme le nom, les icônes et la couleur du thème, pour configurer l'apparence de l'application PWA.

  # Routes pour Devise (authentification)
  devise_for :users  # Gère l'inscription, la connexion, la déconnexion et autres routes d'authentification

  # Routes pour les utilisateurs
  resources :users, only: [:index, :show, :new, :create] do # Gestion des utilisateurs : affichage, profils individuels, inscription
    member do
      get 'events', to: 'attendances#index', as: :events
    end
  end

  # Routes pour les événements avec participations
  resources :events do
    resources :attendances, only: [:index, :new, :create, :destroy]  # Routes pour afficher, créer, et supprimer des participations
    # pour un événement spécifique
  end

  # Définit la page d'accueil par défaut sur la liste des événements
  root "events#index"  # Redirige la page d'accueil vers la liste des événements

  # Route pour LetterOpenerWeb en mode développement
  #if Rails.env.development?
  # mount LetterOpenerWeb::Engine, at: "/letter_opener"
  #end

    # Route pour LetterOpenerWeb en mode développement
    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener-web"
    end
end
# Mémo : 
#Le montage de LetterOpenerWeb est conditionné par Rails.env.development?, donc il sera actif uniquement en développement.
#L’emplacement at: "/letter_opener" est configuré pour que l’interface soit accessible à http://localhost:3000/letter_opener.