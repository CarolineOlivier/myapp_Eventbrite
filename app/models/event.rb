class Event < ApplicationRecord
    # Associations
    belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'   # Associe un événement à son créateur (admin)
    has_many :attendances, dependent: :destroy                       # Associe un événement à ses participations
    has_many :participants, through: :attendances, source: :user     # Liste des participants de l'événement via les participations
  
    # Validations
    validates :start_date, presence: true                            # Date de début obligatoire
    validate :start_date_cannot_be_in_the_past                       # Empêche de créer un événement dans le passé
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 } # Durée obligatoire et positive
    validates :title, presence: true, length: { in: 5..140 }         # Titre obligatoire et longueur restreinte
    validates :description, presence: true, length: { in: 20..1000 } # Description obligatoire et longueur restreinte
    validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 } # Prix entre 1 et 1000
    validates :location, presence: true                              # Lieu obligatoire
  
    private
  
    # Méthode de validation pour empêcher les dates dans le passé
    def start_date_cannot_be_in_the_past
      if start_date.present? && start_date < Date.today
        errors.add(:start_date, "ne peut pas être dans le passé")    # Message d'erreur personnalisé
      end
    end
  end
  