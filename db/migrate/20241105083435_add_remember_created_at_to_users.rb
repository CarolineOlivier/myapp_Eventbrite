class AddRememberCreatedAtToUsers < ActiveRecord::Migration[7.0]
  # Cette migration ajoute une colonne `remember_created_at` à la table `users`.
  # Cette colonne est utilisée par Devise pour gérer la fonctionnalité "Remember Me",
  # en stockant la date et l'heure de la dernière connexion mémorisée de l'utilisateur.

  def change
    # Ajoute une colonne appelée `remember_created_at` de type `datetime` à la table `users`.
    # Le type `datetime` permet de stocker une information de date et d'heure.
    add_column :users, :remember_created_at, :datetime
  end
end
