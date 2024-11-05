# README
# Eventbrite Clone

Cette application est une version simplifiée de Eventbrite, permettant aux utilisateurs de s'inscrire, de se connecter et de créer, visualiser et gérer des événements. Elle est construite avec Ruby on Rails, avec l'utilisation de la gem Devise pour l'authentification et de Bootstrap pour le style.

## Fonctionnalités

- **Authentification** : Inscription, connexion, et déconnexion via Devise
- **Événements** :
  - Création d'événements pour les utilisateurs connectés
  - Affichage d'une liste des événements sur la page d'accueil
  - Détail d'un événement avec informations complètes
  - Page de profil utilisateur avec les événements créés
- **Navigation** : Une barre de navigation adaptable pour les utilisateurs connectés et non connectés

## Technologies


- **Backend** : Ruby on Rails (version 7.2.1.2)
- **Ruby** : 3.2.2
- **Base de données** : PostgreSQL 17.0
- **Authentification** : Devise
- **Frontend** : Bootstrap 4
- **Déploiement** : Fly.io

## Installation

1. Clonez ce repository :
    ```bash
    git clone https://github.com/CarolineOlivier/myapp_Eventbrite.git
    ```
2. Installez les dépendances :
    ```bash
    bundle install
    yarn install
    ```

3. lancer postgresql
    ```bash
    sudo service postgresql start
    ```

4. Configurez la base de données :
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```
5. Lancez le serveur Rails :
    ```bash
    rails server
    ```

L'application sera accessible à `http://localhost:3000`.

## Utilisation

1. **Inscription / Connexion** : Les utilisateurs peuvent s'inscrire ou se connecter via la navbar.
2. **Création d'événements** : Une fois connecté, un utilisateur peut créer un événement.
3. **Page de profil** : Affiche les informations de l'utilisateur et les événements créés par lui.
4. **Page d'accueil** : Affiche la liste des événements disponibles.

## Déploiement

Pour déployer cette application sur Fly.io :

1. Installez l'outil en ligne de commande Fly :
    ```bash
    flyctl launch
    ```
2. Suivez les instructions pour configurer le déploiement et déployez :
    ```bash
    flyctl deploy
    ```

## Contributeurs

- Caroline Olivier

## License

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
