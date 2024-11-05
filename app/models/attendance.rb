 # le modèle  Attendance représente la participation à un événement. 
 # C'est la table de jointure entre les événements et les participants à un événement 

class Attendance < ApplicationRecord
  # Associations
  belongs_to :user           # Chaque participation est liée à un utilisateur
  belongs_to :event          # Chaque participation est liée à un événement

  # Validations
  validates :stripe_customer_id, presence: true                   # L'identifiant Stripe est obligatoire pour chaque participation
  validates :user_id, uniqueness: { scope: :event_id }            # Un utilisateur ne peut s'inscrire qu'une fois à un même événement
end

# note : 
# Dans le modèle Attendance, 
# les associations belongs_to :user et belongs_to :event gèrentdéjà les attributs user_id et event_id.
 # Rails ajoute automatiquement les colonnes user_id et event_id en base de données lorsqu’on utilise belongs_to.