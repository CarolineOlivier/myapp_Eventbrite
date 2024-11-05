class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_date, null: false    # Date de début de l'événement, obligatoire
      t.integer :duration, null: false       # Durée en minutes, obligatoire
      t.string :title, null: false           # Titre de l'événement, obligatoire
      t.text :description, null: false       # Description de l'événement, obligatoire
      t.integer :price, null: false          # Prix en euros, obligatoire
      t.string :location, null: false        # Lieu de l'événement, obligatoire

      t.timestamps                           # Ajoute les colonnes created_at et updated_at.
    end
  end
end


