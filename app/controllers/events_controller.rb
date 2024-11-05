class EventsController < ApplicationController
    # Affiche la liste des événements futurs et passés (utile pour un espace administrateur)
    def index
      @future_events = Event.where("start_date >= ?", Date.today).order(:start_date) # Récupère les événements à venir triés par date
      @past_events = Event.where("start_date < ?", Date.today).order(start_date: :desc) # Récupère les événements passés, triés de la plus récente à la plus ancienne
    end
  
    # Affiche les détails d'un événement spécifique
    def show
      @event = Event.find(params[:id])                            # Charge l'événement avec l'id donné
      @attendances = @event.attendances                           # Récupère toutes les participations pour cet événement
      @participants = @event.participants                         # Liste des participants, utile pour l'affichage
    end
  
    # Prépare un nouvel événement pour le formulaire de création
    def new
      @event = Event.new                                          # Initialise un nouvel objet Event pour le formulaire
    end
  
    # Crée un nouvel événement avec l'utilisateur connecté en tant qu'administrateur
    def create
      @event = Event.new(event_params.merge(admin_id: current_user.id)) # Associe l'utilisateur connecté comme administrateur
      if @event.save
        redirect_to @event, notice: 'Événement créé avec succès.'       # Redirige vers l'événement si la sauvegarde réussit
      else
        render :new                                                     # Réaffiche le formulaire en cas d'erreur
      end
    end
  
    private   # Autorise uniquement les paramètres sécurisés pour un utilisateur
  
    # Filtre des paramètres autorisés pour créer un événement
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location) # Liste des paramètres autorisés
    end
  end
  