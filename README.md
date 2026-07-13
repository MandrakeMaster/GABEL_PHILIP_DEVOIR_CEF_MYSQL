# Projet Base de Données - Tifosi

Ce projet consiste en la modélisation, la création et l'alimentation d'une base de données MySQL pour la gestion de la pizzeria "Tifosi". Devoir pour la formation CEF Developpeur web.

## Structure du projet
- `sql/01_schema.sql` : Script de création de la base de données, de l'utilisateur et des tables.
- `sql/02_data.sql` : Script d'insertion des données de test.
- `sql/03_test.sql` : Script contenant les 10 requêtes de vérification.
- `Rapport_Test_Tifosi.pdf` : Rapport détaillé des résultats des requêtes.

## Installation
Pour installer la base de données, exécutez les commandes suivantes dans votre terminal :

1. Création de la structure :
   mysql -u root -p < sql/01_schema.sql 
   (Le mot de passe de votre compte root MySQL sera demandé)

2. Peuplement de la base :
   mysql -u tifosi -p tifosi < sql/02_data.sql 
   (Saisissez le mot de passe utilisateur configuré dans le schéma : #Tifosi2026)

3. Exécution des tests :
   mysql -u tifosi -p tifosi < sql/03_test.sql

## Rapport de tests
Les résultats détaillés des requêtes de vérification sont disponibles dans le fichier [Rapport_Test_Tifosi.pdf]