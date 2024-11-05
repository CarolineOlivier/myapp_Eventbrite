class UsersController < ApplicationController
    # Affiche la liste de tous les utilisateurs (utile pour un espace administrateur)
    def index
      @users = User.all                               # Récupère tous les utilisateurs et les stocke dans @users
    end
  
    # Affiche le profil individuel d'un utilisateur
    def show
      @user = User.find(params[:id])                  # Charge l'utilisateur avec l'id donné
      @events = @user.events                          # Récupère tous les événements créés par cet utilisateur
    end
  
    # Prépare un nouvel utilisateur pour le formulaire de création
    def new
      @user = User.new                                # Initialise un nouvel objet User pour le formulaire
    end
  
    # Crée un nouvel utilisateur
    def create
      @user = User.new(user_params)                   # Initialise un nouvel utilisateur avec les paramètres autorisés
      if @user.save                                   # Tente de sauvegarder l'utilisateur dans la base de données
        UserMailer.welcome_email(@user).deliver_now   # Envoie un email de bienvenue après la création
        redirect_to @user, notice: 'Utilisateur créé avec succès.' # Redirige vers l'utilisateur si la sauvegarde réussit
      else
        render :new                                   # Si la sauvegarde échoue, recharge le formulaire
      end
    end
  
    private # Autorise uniquement les paramètres sécurisés pour un utilisateur
  
    def user_params
      params.require(:user).permit(:email, :password, :description, :first_name, :last_name) # Filtre des paramètres autorisés
    end
  end
  