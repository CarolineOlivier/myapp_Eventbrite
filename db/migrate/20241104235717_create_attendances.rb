class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|

      t.references :user, null: false, foreign_key: true     # Référence à la table users (clé étrangère)

      # Avec null: false, cela signifie que la colonne user_id ne peut jamais être vide dans la base de données,
      # donc chaque Attendance doit être associé à un User.

      # foreign_key: true garantit que user_id fait référence à un enregistrement existant dans la table users.

      t.references :event, null: false, foreign_key: true    # Référence à la table events (clé étrangère)

      # En activant null:
      # false, on s'assure que chaque enregistrement de participation (attendance) 
      # est obligatoirement associé à un événement. 
      # Si un Attendance n’a pas de event_id, la base de données renverra une erreur.

      # foreign_key: true :
      # Cela crée une contrainte de clé étrangère dans la base de données, 
      # qui fait en sorte que chaque valeur de event_id dans la table attendances doit correspondre à une id dans la table events.
      # Cette contrainte assure l’intégrité référentielle : si un enregistrement Event est supprimé,
      #toutes les participations Attendance qui y sont liées (ayant le même event_id) seront aussi affectées,
      # protégeant la base de données des incohérences.
      #  Cela signifie que la base de données va vérifier qu’aucun event_id invalide ne peut être ajouté dans attendances.

       #Utiliser à la fois null: false et foreign_key: true garantit à la fois :
       # Que chaque Attendance possède bien une valeur dans user_id (null: false),
       # Que cette valeur pointe vers un utilisateur existant (foreign_key: true).
       # Ensemble, ils rendent la base de données plus solide en s'assurant que chaque Attendance 
       # est correctement lié à un utilisateur réel.

      t.string :stripe_customer_id                           # ID client unique donné par Stripe pour chaque paiement

      t.timestamps
    end
    add_index :attendances, [:user_id, :event_id], unique: true 
    # Crée un index unique combinant user_id et event_id, 
    # empêchant un utilisateur de s'inscrire plusieurs fois au même événement.
  end
end


