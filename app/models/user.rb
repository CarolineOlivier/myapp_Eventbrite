class User < ApplicationRecord
    # Associe chaque utilisateur avec les événements qu'il a créés et auxquels il participe
    has_many :created_events, class_name: 'Event', foreign_key: 'admin_id', dependent: :destroy 
    has_many :attendances, dependent: :destroy                  # Associe un utilisateur à ses participations
    has_many :events, through: :attendances                     # L'utilisateur peut participer à plusieurs événements
  
    # Gestion de mot de passe avec bcrypt (nécessite le champ `password_digest`)
    has_secure_password
  
    # Validations
    validates :email, presence: true, uniqueness: true          # Assure un email unique pour chaque utilisateur
    validates :first_name, presence: true                       # Le prénom est obligatoire
    validates :last_name, presence: true                        # Le nom est obligatoire
    validates :description, length: { minimum: 20, maximum: 1000 }, allow_blank: true  # Description facultative mais avec limites de longueur
  
    # Ajout d'un callback pour les actions après la création
    after_create :send_welcome_email
  
    private
  
    # Envoie un e-mail de bienvenue à l'utilisateur lors de son inscription
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end
  end
  