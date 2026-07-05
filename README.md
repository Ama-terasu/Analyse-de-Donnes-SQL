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
```

Q2. Rapport d'activité complet
Objectif : Cartographier tous les clients et leurs locations, incluant les profils n'ayant pas encore loué de jeu grâce à un double LEFT JOIN.
```
SELECT clients.prenom, clients.formule_abonnement, jeux.titre 
FROM clients 
LEFT JOIN locations ON clients.id = locations.client_id 
LEFT JOIN jeux ON locations.jeu_id = jeux.id;
```
Q3. Ciblage de la campagne Marketing 
Objectif : Isoler les clients qui n'ont jamais effectué de location pour une campagne de relance en utilisant une sous-requête d'exclusion (NOT IN).
```
SELECT prenom, pays 
FROM clients 
WHERE id NOT IN (
    SELECT client_id 
    FROM locations
);
```
Q4. Identification des consommations "Haut de Gamme"
Objectif : Lister les utilisateurs ayant loué des jeux dont la valeur est strictement supérieure à la moyenne globale du catalogue (Combinaison de doubles INNER JOIN et d'une sous-requête scalaire).
```
SELECT clients.prenom, jeux.titre 
FROM clients 
INNER JOIN locations ON locations.client_id = clients.id 
INNER JOIN jeux ON jeux.id = locations.jeu_id 
WHERE jeux.prix_vendeur > (
    SELECT AVG(prix_vendeur) 
    FROM jeux
);
```

## Comment l'executer ?
Pour exécuter et tester ces requêtes d'analyse chez vous :
1. Copiez le contenu du fichier `schema.sql` présent dans ce dépôt.
2. Collez-le dans votre outil SQL 
3. Exécutez le script pour générer la base de données et insérer les données de test.
4. Vous pouvez ensuite copier-coller et lancer les requêtes d'analyses détaillées ci-dessous !
