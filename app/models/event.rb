class Event < ApplicationRecord
    # Associe chaque événement à un utilisateur en tant qu'administrateur
    belongs_to :admin, class_name: 'User'
#belongs_to :admin, class_name: 'User' : Cette ligne associe chaque événement à un administrateur qui est un utilisateur (User). 
#En utilisant class_name: 'User', Rails sait que admin_id se réfère à la table users.




    # Validations
    validates :start_date, presence: true                                # Date de début obligatoire
    validate :start_date_cannot_be_in_the_past                           # Empêche de créer un événement à une date passée
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 } # Durée obligatoire et positive
    validate :duration_multiple_of_5                                     # Durée doit être un multiple de 5
    validates :title, presence: true, length: { in: 5..140 }             # Titre obligatoire et longueur restreinte
    validates :description, presence: true, length: { in: 20..1000 }     # Description obligatoire et longueur restreinte
    validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 } # Prix entre 1 et 1000
    validates :location, presence: true                                  # Lieu obligatoire

    # Custom validation methods
    def start_date_cannot_be_in_the_past
    errors.add(:start_date, "ne peut pas être dans le passé") if start_date.present? && start_date < DateTime.now
    end

    def duration_multiple_of_5
    errors.add(:duration, "doit être un multiple de 5") if duration.present? && duration % 5 != 0
    end
end