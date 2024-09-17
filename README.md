# Description
Cette application Flutter est destinée aux livreurs pour la gestion des colis. Elle permet de visualiser les colis, changer leur statut, et envoyer des notifications par SMS aux clients lorsque le livreur est en route. L'application est conçue pour une utilisation efficace sur mobile avec une interface intuitive.

# Fonctionnalités
Visualisation des colis en attente, en cours de livraison ou livrés.

Changement de statut des colis (en route, livré, retourné).

Envoi automatique d'un SMS au client lorsque le livreur prend en charge le colis.

Connexion sécurisée avec un backend NestJS via JWT (JSON Web Tokens).

 # Prérequis
-Flutter SDK version 3.0 ou supérieure.

-Android Studio ou Xcode pour émuler l'application.

-Un terminal (ou ligne de commande).
# Étapes d'installation
Clonez ce repository dans votre machine locale 

Accédez au répertoire du projet 

Installez les dépendances Flutter 
flutter pub get

Démarrez l'application sur un émulateur ou appareil physique :
flutter run

# Configuration
Connexion au backend :
Assurez-vous que votre backend (NestJS) est en cours d'exécution et accessible à partir de l'application mobile.
Envoi de SMS via Twilio :
Configurez les informations Twilio dans le backend. Le service de SMS nécessite un compte Twilio valide.
Assurez-vous que le backend envoie correctement les SMS lorsque le statut des colis change.
# Captures d'écran


# Technologies utilisées
Flutter : Pour le développement de l'application mobile.

Dart : Langage utilisé pour Flutter.

NestJS : Backend pour la gestion des colis et des utilisateurs.

MongoDB : Base de données utilisée pour stocker les informations des colis et des livreurs.

Twilio : Pour l'envoi de notifications par SMS.

JWT (JSON Web Token) : Pour l'authentification et la sécurisation des API.
