-- 1. Création des structures des tables
CREATE TABLE clients (
    id INT PRIMARY KEY,
    prenom VARCHAR(50),
    formule_abonnement VARCHAR(50),
    pays VARCHAR(50)
);

CREATE TABLE jeux (
    id INT PRIMARY KEY,
    titre VARCHAR(100),
    console VARCHAR(50),
    prix_vendeur DECIMAL(5,2)
);

CREATE TABLE locations (
    id INT PRIMARY KEY,
    client_id INT,
    jeu_id INT,
    statut VARCHAR(50)
);

-- 2. Insertion des données de test
INSERT INTO clients VALUES 
(1, 'Karim', 'Premium', 'France'),
(2, 'Chloé', 'Basique', 'Belgique'),
(3, 'Youssef', 'Premium', 'France'),
(4, 'Sarah', 'Basique', 'France');

INSERT INTO jeux VALUES 
(101, 'Sonic the Hedgehog', 'Mega Drive', 30),
(102, 'Super Mario World', 'SNES', 45),
(103, 'Zelda: Ocarina of Time', 'Nintendo 64', 70),
(104, 'Crash Bandicoot', 'PlayStation', 25);

INSERT INTO locations VALUES 
(501, 1, 101, 'Rendu'),
(502, 1, 103, 'En cours'),
(503, 2, 102, 'Rendu'),
(504, 4, 101, 'Rendu');