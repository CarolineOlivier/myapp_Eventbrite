# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Créer 10 utilisateurs avec des adresses @yopmail.com
users = User.create([
  { email: "alice@yopmail.com", password: "password123", first_name: "Alice", last_name: "Smith", description: "Passionnée d'événements en tout genre." },
  { email: "bob@yopmail.com", password: "password123", first_name: "Bob", last_name: "Johnson", description: "Organisateur de nombreux événements." },
  { email: "charlie@yopmail.com", password: "password123", first_name: "Charlie", last_name: "Brown", description: "Amateur de concerts." },
  { email: "diana@yopmail.com", password: "password123", first_name: "Diana", last_name: "Prince", description: "Adepte des événements culturels." },
  { email: "edward@yopmail.com", password: "password123", first_name: "Edward", last_name: "Snow", description: "Fan de peinture et d'ateliers créatifs." },
  { email: "fiona@yopmail.com", password: "password123", first_name: "Fiona", last_name: "Green", description: "Passionnée de cinéma." },
  { email: "george@yopmail.com", password: "password123", first_name: "George", last_name: "Martin", description: "Amoureux de la musique live." },
  { email: "helen@yopmail.com", password: "password123", first_name: "Helen", last_name: "White", description: "Participe régulièrement à des conférences." },
  { email: "ian@yopmail.com", password: "password123", first_name: "Ian", last_name: "Black", description: "Fan de danse et de performances scéniques." },
  { email: "julia@yopmail.com", password: "password123", first_name: "Julia", last_name: "Blue", description: "Aime les festivals et les événements en plein air." }
])

# Créer 10 événements avec des administrateurs variés
events = Event.create([
  { start_date: DateTime.now + 1.day, duration: 120, title: "Concert Jazz", description: "Un concert pour les amateurs de jazz.", price: 50, location: "Salle de concert", admin: users[0] },
  { start_date: DateTime.now + 2.days, duration: 90, title: "Atelier Peinture", description: "Un atelier pour libérer votre créativité.", price: 30, location: "Studio d'art", admin: users[1] },
  { start_date: DateTime.now + 3.days, duration: 60, title: "Projection Cinéma", description: "Une soirée cinéma en plein air.", price: 15, location: "Parc Central", admin: users[2] },
  { start_date: DateTime.now + 4.days, duration: 180, title: "Conférence Tech", description: "Présentation des dernières innovations technologiques.", price: 80, location: "Centre des Congrès", admin: users[3] },
  { start_date: DateTime.now + 5.days, duration: 45, title: "Yoga en plein air", description: "Session de yoga pour tous niveaux.", price: 10, location: "Parc Central", admin: users[4] },
  { start_date: DateTime.now + 6.days, duration: 90, title: "Festival de Musique", description: "Festival de musique en plein air avec plusieurs artistes.", price: 100, location: "Stade", admin: users[5] },
  { start_date: DateTime.now + 7.days, duration: 120, title: "Dîner Gastronomique", description: "Soirée gastronomique avec des chefs étoilés.", price: 150, location: "Hôtel de Ville", admin: users[6] },
  { start_date: DateTime.now + 8.days, duration: 60, title: "Atelier Écriture", description: "Libérez votre créativité avec des exercices d'écriture.", price: 20, location: "Bibliothèque", admin: users[7] },
  { start_date: DateTime.now + 9.days, duration: 120, title: "Marche Santé", description: "Marche pour promouvoir la santé et le bien-être.", price: 5, location: "Promenade du Parc", admin: users[8] },
  { start_date: DateTime.now + 10.days, duration: 90, title: "Exposition d'Art", description: "Exposition d'œuvres d'art locales.", price: 25, location: "Galerie d'Art", admin: users[9] }
])

# Créer des participations variées
Attendance.create([
  # Utilisateurs avec une seule participation
  { user: users[0], event: events[2], stripe_customer_id: "cus_test001" },
  { user: users[1], event: events[3], stripe_customer_id: "cus_test002" },
  { user: users[3], event: events[1], stripe_customer_id: "cus_test003" },
  { user: users[4], event: events[5], stripe_customer_id: "cus_test004" },
  { user: users[6], event: events[7], stripe_customer_id: "cus_test005" },

  # Utilisateurs avec plusieurs participations
  { user: users[7], event: events[0], stripe_customer_id: "cus_test006" },
  { user: users[7], event: events[3], stripe_customer_id: "cus_test007" },
  { user: users[7], event: events[8], stripe_customer_id: "cus_test008" },
  { user: users[8], event: events[2], stripe_customer_id: "cus_test009" },
  { user: users[8], event: events[4], stripe_customer_id: "cus_test010" },
  { user: users[8], event: events[9], stripe_customer_id: "cus_test011" }
  # Certains utilisateurs (users[2], users[5], users[9]) ne participent à aucun événement
])

