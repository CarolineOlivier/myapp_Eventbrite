class UserMailer < ApplicationMailer
# Déclare la classe UserMailer, qui hérite de ApplicationMailer.
# Cela permet d'utiliser toutes les fonctionnalités de base d’un mailer.

    # Méthode pour envoyer un e-mail de bienvenue à un nouvel utilisateur
    def welcome_email(user)    #Définit la méthode welcome_email, 
        # qui prend en paramètre un utilisateur (user). Cette méthode enverra l’e-mail de bienvenue à cet utilisateur.
        @user = user          # Associe l’argument user à une instance variable @user, 
        # ce qui permet d’accéder aux informations de l’utilisateur dans le template de l’e-mail.
      mail(                   # Envoie l’e-mail.
        to: @user.email,      # indique l’adresse e-mail du destinataire (l'utilisateur)
        subject: 'Bienvenue sur Eventbrite !'  # Sujet de l'e-mail
      )
    end
  end
  
