# TP3_CSharp_Banque
Description:

BANQUEBACK est une application de gestion bancaire développée en C# avec Windows Forms. Elle permet la gestion des clients, des comptes bancaires (courant et épargne) et des conseillers. L'application utilise une interface graphique pour faciliter l'interaction avec l'utilisateur.

Fonctionnalités :

Gestion des clients
Gestion des comptes (courant et épargne)
Connexion et gestion des conseillers
Interface utilisateur avec Windows Forms

Prérequis :

Visual Studio (version compatible avec les projets .NET Framework)
.NET Framework installé

Installation:

Cloner ou extraire le projet.
Ouvrir le fichier BANQUEBACK.sln avec Visual Studio.
Restaurer les packages NuGet si nécessaire.
Compiler et exécuter le projet.
Structure du projet

mabanque/ : Contient les fichiers sources de l'application.

Client.cs : Modélisation d'un client.
Compte.cs : Classe de base pour les comptes bancaires.
CompteCourant.cs : Gestion des comptes courants.
CompteEpargne.cs : Gestion des comptes épargne.
Conseiller.cs : Gestion des conseillers.
DBInterface.cs : Interface avec la base de données.
Form1.cs : Interface graphique principale.
