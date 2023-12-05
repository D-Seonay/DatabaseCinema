-- Données pour la table PAYS
INSERT INTO PAYS (id_pays, code_pays, designation) VALUES
(1, 'FR', 'France'),
(2, 'US', 'United States'),
(3, 'UK', 'United Kingdom');

-- Données pour la table NATIONALITES
INSERT INTO NATIONALITES (id_nationalite, code_nationalite, nom_nationalite, code_pays) VALUES
(1, 'FRA', 'Française', 'FR'),
(2, 'USA', 'Américaine', 'US'),
(3, 'GBR', 'Britannique', 'UK');

-- Données pour la table INTERVENANTS
INSERT INTO INTERVENANTS (id_intervenant, nom, prenom, code_nationalite, sexe) VALUES
(1, 'Dupont', 'Jean', 'FRA', 'M'),
(2, 'Smith', 'John', 'USA', 'M'),
(3, 'Johnson', 'Emma', 'GBR', 'F');

-- Données pour la table ADHERENTS
INSERT INTO ADHERENTS (id_adherent, nom, prenom, adresse, code_postal, ville, paiement_cotis, code_nationalite) VALUES
(1, 'Martin', 'Claire', '123 Rue A', '75001', 'Paris', 50.00, 'FRA'),
(2, 'Johnson', 'Michael', '456 Main St', '90001', 'Los Angeles', 40.00, 'USA'),
(3, 'Garcia', 'Sophie', '789 High St', 'SW1A 1AA', 'London', 45.00, 'GBR');

-- Données pour la table SALLES
INSERT INTO SALLES (id_salle, nom, id_adresse) VALUES
(1, 'Salle 1', 1),
(2, 'Salle 2', 2),
(3, 'Salle 3', 3);

-- Données pour la table ADRESSES_SALLES
INSERT INTO ADRESSES_SALLES (id_salle, adresse, ville, code_postal, pays) VALUES
(1, '123 Rue B', 'Paris', '75002', 'FR'),
(2, '789 Main St', 'Los Angeles', '90002', 'US'),
(3, '456 High St', 'London', 'SW1A 2AA', 'UK');

-- Données pour la table GENRE
INSERT INTO GENRE (id_genre, nom_genre) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame');

-- Données pour la table SOUS_GENRE
INSERT INTO SOUS_GENRE (id_sous_genre, code_genre, details) VALUES
(1, 1, 'Action aventure'),
(2, 1, 'Action thriller'),
(3, 2, 'Comédie romantique'),
(4, 3, 'Drame psychologique');

-- Données pour la table FILMS
INSERT INTO FILMS (id_film, titre, annee, duree, code_genre, code_sous_genre, code_nationalite) VALUES
(1, 'Film 1', 2020, 120, 1, 1, 'FRA'),
(2, 'Film 2', 2019, 105, 2, 3, 'USA'),
(3, 'Film 3', 2021, 130, 3, 4, 'GBR');

-- Données pour la table ACTEURS
INSERT INTO ACTEURS (numinterv, numfilm) VALUES
(1, 1),
(2, 2),
(3, 3);
