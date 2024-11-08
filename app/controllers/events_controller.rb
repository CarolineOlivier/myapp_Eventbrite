
class EventsController < ApplicationController
  # Restreint l'accès aux actions new et create aux utilisateurs connectés seulement
  before_action :authenticate_user!, only: [:new, :create]

  # Affiche la liste des événements futurs et passés
    def index
      # Récupère les événements à venir, triés par date
      @upcoming_events = Event.where("start_date >= ?", Date.today).order(start_date: :asc)
      @past_events = Event.where("start_date < ?", Date.today).order(start_date: :desc)
      # Récupère les événements passés, triés de la date la plus récente à la plus ancienne
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

  def create
    # Crée un nouvel objet événement avec les paramètres du formulaire (event_params),
    # tout en ajoutant l'ID de l'utilisateur connecté dans le champ admin_id.
    # Cela associe automatiquement l'événement à l'utilisateur actuel en tant qu'administrateur.
    @event = Event.new(event_params.merge(admin_id: current_user.id))
    
    # Tente de sauvegarder l'événement dans la base de données.
    # Si la sauvegarde est réussie, cela signifie que toutes les validations sont respectées.
    if @event.save
      # Si l'enregistrement de l'événement réussit, redirige l'utilisateur vers la page de l'événement.
      # Affiche un message de confirmation pour indiquer que l'événement a été créé avec succès.
      redirect_to @event, notice: 'Événement créé avec succès.'
    else
      # Si la sauvegarde échoue (par exemple, en cas d'erreurs de validation),
      # réaffiche le formulaire de création d'événement avec les messages d'erreur,
      # et renvoie un statut HTTP "unprocessable_entity" pour indiquer un problème avec les données soumises.
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  # Filtre pour restreindre les paramètres autorisés lors de la création d'un événement
  def event_params
    # Seuls ces paramètres sont autorisés pour éviter les injections de données non désirées
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end  


