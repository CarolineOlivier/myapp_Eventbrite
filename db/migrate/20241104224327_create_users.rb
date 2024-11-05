class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name # Prénom de l'utilisateur
      t.string :last_name  # Nom de l'utilisateur
      t.string :email, null: false, default: "" # Champ email obligatoire et non nul, avec une valeur par défaut vide
      t.text :description  # Description de l'utilisateur
      t.string :password_digest, null: false, default: "" # Définit un champ password_digest, obligatoire,
      # pour stocker le mot de passe chiffré avec bcrypt.


      t.timestamps # Ajoute created_at et updated_at automatiquement
    end
    add_index :users, :email, unique: true  # Ajoute un index unique sur l'email pour garantir son unicité dans la base de données
    # en effet : 
    #Cette ligne crée un index sur la colonne email dans la table users,
    # ce qui optimise la recherche d’utilisateurs par leur email.
    #En ajoutant unique: true, on s’assure qu’aucun utilisateur ne puisse avoir la même adresse email,
    # renforçant ainsi l’unicité des emails directement au niveau de la base de données.
  end
end

