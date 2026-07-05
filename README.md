# 🎮 RetroPlay - Analyse de Données SQL 

Ce projet personnel met en pratique mes compétences en SQL (Jointures multiples, Groupements, et Sous-requêtes avancées) à travers l'analyse d'une base de données fictive pour une plateforme de location de jeux vidéo rétro.

## 📊 Structure de la Base de Données

Le projet s'articule autour de 3 tables principales :
* `clients` : Informations sur les membres et leurs abonnements.
* `jeux` : Catalogue des jeux disponibles et leur valeur marchande.
* `locations` : Historique et statut des locations.

---

## 🔍 Requêtes d'Analyse Réalisées

### 1. Analyse financière du catalogue par console
**Objectif :** Obtenir une vue d'ensemble du stock et cibler les consoles haut de gamme (prix moyen > 30€).
```sql
SELECT console, COUNT(*), AVG(prix_vendeur) 
FROM jeux 
GROUP BY console 
HAVING AVG(prix_vendeur) > 30;

## Comment l'executer ?
Pour exécuter et tester ces requêtes d'analyse chez vous :
1. Copiez le contenu du fichier `schema.sql` présent dans ce dépôt.
2. Collez-le dans votre outil SQL 
3. Exécutez le script pour générer la base de données et insérer les données de test.
4. Vous pouvez ensuite copier-coller et lancer les requêtes d'analyses détaillées ci-dessous !
