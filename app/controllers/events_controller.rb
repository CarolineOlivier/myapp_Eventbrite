
class EventsController < ApplicationController
  # Restreint l'accès aux actions new et create aux utilisateurs connectés seulement
  before_action :authenticate_user!, only: [:new, :create]

  # Affiche la liste des événements futurs et passés
  def index
    # Récupère les événements à venir, triés par date
    @future_events = Event.where("start_date >= ?", Date.today).order(:start_date)
    # Récupère les événements passés, triés de la date la plus récente à la plus ancienne
    @past_events = Event.where("start_date < ?", Date.today).order(start_date: :desc)
  end

  # Affiche les détails d'un événement spécifique
  def show
    # Récupère l'événement correspondant à l'ID fourni dans les paramètres
    @event = Event.find(params[:id])
    # Récupère toutes les participations à cet événement
    @attendances = @event.attendances
    # Récupère la liste des participants associés à cet événement
    @participants = @event.participants
  end

  # Prépare un nouvel événement pour le formulaire de création
  def new
    # Initialise un nouvel objet Event pour le formulaire
    @event = Event.new
  end

  # Crée un nouvel événement en associant l'utilisateur connecté en tant qu'administrateur
  def create
    # Crée un nouvel événement avec les paramètres du formulaire, en y ajoutant l'ID de l'utilisateur connecté
    @event = Event.new(event_params.merge(admin_id: current_user.id))
    
    # Si l'enregistrement de l'événement réussit, redirige vers la page de l'événement
    if @event.save
      redirect_to @event, notice: 'Événement créé avec succès.'
    else
      # Si l'enregistrement échoue, réaffiche le formulaire de création avec les messages d'erreur
      render :new
    end
  end

  private

  # Filtre pour restreindre les paramètres autorisés lors de la création d'un événement
  def event_params
    # Seuls ces paramètres sont autorisés pour éviter les injections de données non désirées
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end  


