-- Données pour la table PAYS
INSERT INTO PAYS (id_pays, code_pays, designation) VALUES
(1, 'FR', 'France'),
(2, 'US', 'United States'),
(3, 'UK', 'United Kingdom');

-- Données pour la table NATIONALITES
INSERT INTO NATIONALITES (id_nationalite, code_nationalite, nom_nationalite, id_pays) VALUES
(1, 'FRA', 'Française', 1),
(2, 'USA', 'Américaine', 2),
(3, 'GBR', 'Britannique', 3);

-- Données pour la table INTERVENANTS
INSERT INTO INTERVENANTS (id_intervenant, nom, prenom, id_nationalite, sexe) VALUES
(1, 'Dupont', 'Jean', 'FRA', 'M'),
(2, 'Smith', 'John', 'USA', 'M'),
(3, 'Johnson', 'Emma', 'GBR', 'F'),
(4, 'Reynolds', 'Ryan', 'CAN', 'M'),
(5, 'Spielberg', 'Steven', 'USA', 'M'),
(6, 'Tautou', 'Audrey', 'FRA', 'F');

-- Données pour la table ADHERENTS
INSERT INTO ADHERENTS (id_adherent, nom, prenom, adresse, code_postal, ville, paiement_cotis, id_nationalite) VALUES
(1, 'Martin', 'Claire', '123 Rue A', '75001', 'Paris', 50.00, 'FRA'),
(2, 'Johnson', 'Michael', '456 Main St', '90001', 'Los Angeles', 40.00, 'USA'),
(3, 'Garcia', 'Sophie', '789 High St', 'SW1A 1AA', 'London', 45.00, 'GBR'),
(4, 'Spielberg', 'Steven', '789 High St', 'SW1A 1AA', 'London', 45.00, 'USA'),
(5, 'Stephen', 'King', '789 High St', 'SW1A 1AA', 'London', 45.00, 'USA');

-- Données pour la table SALLES
INSERT INTO SALLES (id_salle, nom, id_adresse) VALUES
(1, 'Salle 1', 1),
(2, 'Salle 2', 2),
(3, 'Salle 3', 3);

-- Données pour la table ADRESSES_SALLES
INSERT INTO ADRESSES_SALLES (id_salle, adresse, ville, code_postal, pays) VALUES
(1, '123 Rue B', 'Paris', '75002', 'FR'),
(2, '789 Main St', 'Los Angeles', '90002', 'US'),
(3, '456 High St', 'London', 'SW1A 2AA', 'UK'),
(4, '456 High St', 'Lille', '59000', 'FR'),
(5, '456 High St', 'Lille', '59000', 'FR');

-- Données pour la table GENRE
INSERT INTO GENRE (id_genre, nom_genre) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame');

-- Données pour la table SOUS_GENRE
INSERT INTO SOUS_GENRE (id_sous_genre, id_genre, details) VALUES
(1, 1, 'Action aventure'),
(2, 1, 'Action thriller'),
(3, 2, 'Comédie romantique'),
(4, 3, 'Drame psychologique'),
(5, 3, 'Drame historique'),
(6, 2, 'Comédie dramatique');


-- Données pour la table FILMS
INSERT INTO FILMS (id_film, titre, annee, duree, id_genre, id_sous_genre, id_nationalite) VALUES
(1, 'Film 1', 2020, 120, 1, 1, 'FRA'),
(2, 'Film 2', 2019, 105, 2, 3, 'USA'),
(3, 'Film 3', 2021, 130, 3, 4, 'GBR'),
(4, 'Pokémon', 2021, 120, 1, 1, 'FRA'),
(5, 'La comédie dramatique pour les nuls', 2021, 120, 2, 6, 'FRA');


-- Données pour la table PRODUCTION
INSERT INTO PRODUCTION (id_production, numfilm, id_nationalite, id_intervenant ) VALUES
(1, 1, 2, 1),
(2, 2, 1, 6),
(3, 3, 3, 3),
(4, 4, 1, 4),
(5, 5, 1, 5),
(6, 5, 2, 5),
(7, 5, 3, 5);

-- Données pour la table RESERVATIONS (veuillez remplir les données selon votre cas d'utilisation)
INSERT INTO RESERVATIONS (id_reservation, numadhe, numseance, nbplaces, a_paye, id_moyen_paiement) VALUES
(1, 1, 1, 2, 20.00, 1),
(2, 2, 2, 3, 30.00, 2);

-- Données pour la table MOYENS_PAIEMENT (ajoutez des méthodes de paiement)
INSERT INTO MOYENS_PAIEMENT (id_moyen_paiement, nom_moyen_paiement) VALUES
(1, 'Carte de crédit'),
(2, 'Espèces'),
(3, 'Chèque');

-- Données pour la table SEANCES (remplissez les détails selon votre besoin)
INSERT INTO SEANCES (id_seance, numfilm, numsalle, jour, heuredeb) VALUES
(1, 1, 1, '2023-12-05', '18:00:00'),
(2, 2, 2, '2023-12-06', '20:00:00'),
(3, 3, 3, '2023-12-07', '22:00:00'),
(4, 4, 4, '2007-12-20', '19:30:00'),
(5, 5, 5, '2023-12-09', '20:00:00');