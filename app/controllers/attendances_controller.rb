class AttendancesController < ApplicationController
    # Affiche les participants pour un événement donné (utile pour un espace administrateur)
    def index
      @event = Event.find(params[:event_id])                     # Récupère l'événement à partir de l'ID fourni
      @attendances = @event.attendances                          # Liste toutes les participations pour cet événement
      @participants = @event.participants                        # Récupère les participants à partir des participations
    end
  
    # Prépare un formulaire pour l'inscription à un événement
    def new
      @attendance = Attendance.new                               # Initialise une nouvelle participation pour le formulaire
    end
  
    # Crée une participation (inscription) pour un utilisateur à un événement donné
    def create
      @attendance = Attendance.new(attendance_params.merge(user_id: current_user.id, event_id: params[:event_id])) 
      # Associe l'utilisateur connecté et l'événement
      if @attendance.save
        AttendanceMailer.participation_email(@attendance).deliver_now    # Envoie un e-mail au créateur de l'événement
        redirect_to event_path(params[:event_id]), notice: 'Inscription réussie.' 
      else
        render :new                                                      # Réaffiche le formulaire en cas d'erreur
      end
    end
  
    # Permet à un administrateur de supprimer une participation
    def destroy
      @attendance = Attendance.find(params[:id])                       # Trouve la participation à supprimer
      @attendance.destroy                                               # Supprime la participation
      redirect_to event_attendances_path(@attendance.event), notice: 'Participation supprimée avec succès.' # Redirige vers la liste des participations de l'événement
    end
  
    private
  
    # Filtre des paramètres autorisés pour créer une participation
    def attendance_params
      params.require(:attendance).permit(:stripe_customer_id) # Autorise uniquement le champ nécessaire pour Stripe
      # Dans ce projet Eventbrite-like, stripe_customer_id représente un identifiant unique généré par Stripe 
      # pour chaque utilisateur qui s’inscrit et paie pour un événement. 
    end
  end
  
# note : 
# Stripe est un service de paiement en ligne qui permet aux entreprises et aux développeurs
# de gérer les paiements en toute sécurité sur leurs sites web ou applications.
# Stripe s'occupe de toute la partie complexe des transactions financières, comme les paiements par carte de crédit,
