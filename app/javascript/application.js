// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "bootstrap";
// Importe le framework Bootstrap, qui inclut les styles CSS et les fonctionnalités JavaScript nécessaires pour ajouter des éléments de design (comme les boutons, les formulaires, les alertes, etc.) dans l'application Rails. Cela permet d'utiliser les classes et composants Bootstrap dans tes vues.

import "../stylesheets/application"; // ajoute cette ligne si tu as créé ce fichier pour des styles personnalisés
// Importe le fichier `application.scss` dans lequel tu peux ajouter des styles personnalisés pour ton application. En ajoutant cette ligne, tu t’assures que tes styles définis dans `application.scss` s'appliquent en même temps que ceux de Bootstrap, permettant de personnaliser l'apparence de ton site.
