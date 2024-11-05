# Cette migration ajoute les colonnes nécessaires pour activer la fonctionnalité
# de réinitialisation du mot de passe via Devise.

class AddRecoverableToUsers < ActiveRecord::Migration[7.0]
  def change
    # Ajoute une colonne pour stocker le token unique de réinitialisation du mot de passe,
    # envoyé à l'utilisateur pour sécuriser la réinitialisation
    add_column :users, :reset_password_token, :string

    # Ajoute une colonne pour enregistrer la date et l'heure d'envoi du lien
    # de réinitialisation du mot de passe, permettant de vérifier sa validité
    add_column :users, :reset_password_sent_at, :datetime

    # Ajoute un index unique sur la colonne reset_password_token pour garantir l'unicité
    # de chaque token et optimiser les recherches
    add_index :users, :reset_password_token, unique: true
  end
end

