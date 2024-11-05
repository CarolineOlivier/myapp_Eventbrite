class User < ApplicationRecord

    # Ajoute les modules Devise pour gérer l'authentification
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    # Associe chaque utilisateur avec les événements qu'il a créés et auxquels il participe
    has_many :created_events, class_name: 'Event', foreign_key: 'admin_id', dependent: :destroy 
    has_many :attendances, dependent: :destroy                  # Associe un utilisateur à ses participations
    has_many :events, through: :attendances                     # L'utilisateur peut participer à plusieurs événements
  
    # Validations
    validates :email, presence: true, uniqueness: true          # Assure un email unique pour chaque utilisateur
    validates :first_name, presence: true                       # Le prénom est obligatoire
    validates :last_name, presence: true                        # Le nom est obligatoire
    validates :description, length: { minimum: 20, maximum: 1000 }, allow_blank: true  # Description facultative mais avec limites de longueur
  
    # Ajout d'un callback pour les actions après la création
    after_create :send_welcome_email

     # Méthode pour retourner le nom complet de l'utilisateur **
  def full_name
    "#{first_name} #{last_name}"
  end  

  # def full_name** : Cette méthode concatène le prénom (first_name) et le nom (last_name) 
  # pour afficher le nom complet de l'utilisateur.
  
    private
  
    # Méthode pour envoyer l’e-mail de bienvenue à l'utilisateur lors de son inscription
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now         # Envoie l’e-mail immédiatement après création de l'utilisateur actuel (self) 
    end
  end
  

 
  