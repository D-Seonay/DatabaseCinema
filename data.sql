-- Création de la table FILMS
CREATE TABLE FILMS (
    id_film INT PRIMARY KEY,
    titre VARCHAR(255),
    annee INT,
    duree INT,
    id_genre INT,
    id_sous_genre INT,
    id_nationalite VARCHAR(3),
    FOREIGN KEY (id_genre) REFERENCES GENRE(id_genre),
    FOREIGN KEY (id_sous_genre) REFERENCES SOUS_GENRE(id_sous_genre),
    FOREIGN KEY (id_nationalite) REFERENCES NATIONALITES(id_nationalite)
);

-- Création de la table INTERVENANTS
CREATE TABLE INTERVENANTS (
    id_intervenant INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    id_nationalite VARCHAR(3),
    sexe CHAR(1),
    FOREIGN KEY (id_nationalite) REFERENCES NATIONALITES(id_nationalite)
);

-- Création de la table NATIONALITES
CREATE TABLE NATIONALITES (
    id_nationalite INT PRIMARY KEY,
    code_nationalite VARCHAR(3),
    nom_nationalite VARCHAR(100),
    id_pays VARCHAR(2),
    FOREIGN KEY (id_pays) REFERENCES PAYS(id_pays)
);

-- Création de la table ADHERENTS
CREATE TABLE ADHERENTS (
    id_adherent INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    adresse VARCHAR(255),
    code_postal VARCHAR(20),
    ville VARCHAR(100),
    paiement_cotis DECIMAL(10, 2),
    id_nationalite VARCHAR(3),
    FOREIGN KEY (id_nationalite) REFERENCES NATIONALITES(id_nationalite)
);

-- Création de la table SALLES
CREATE TABLE SALLES (
    id_salle INT PRIMARY KEY,
    nom VARCHAR(100),
    id_adresse INT,
    FOREIGN KEY (id_adresse) REFERENCES ADRESSES_SALLES(id_salle)
);

CREATE TABLE ADRESSES_SALLES (
    id_salle INT PRIMARY KEY,
    adresse VARCHAR(255),
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    pays VARCHAR(100)
);

-- Création de la table PAYS
CREATE TABLE PAYS (
    id_pays INT PRIMARY KEY,
    code_pays VARCHAR(2),
    designation VARCHAR(100)
);

-- Création de la table GENRE
CREATE TABLE GENRE (
    id_genre INT PRIMARY KEY,
    nom_genre VARCHAR(100),
    numadhe INT,
    numfilm INT,
    FOREIGN KEY (numadhe) REFERENCES ADHERENTS(id_adherent),
    FOREIGN KEY (numfilm) REFERENCES FILMS(id_film)
);

-- Création de la table SOUS_GENRE
CREATE TABLE SOUS_GENRE (
    id_sous_genre INT PRIMARY KEY,
    id_genre INT,
    details VARCHAR(255),
    FOREIGN KEY (id_genre) REFERENCES GENRE(id_genre)
);

-- Création de la table PRODUCTION
CREATE TABLE PRODUCTION (
    id_production INT PRIMARY KEY,
    numfilm INT,
    id_nationalite VARCHAR(2),
    id_intervenant INT,
    FOREIGN KEY (numfilm) REFERENCES FILMS(id_film),
    FOREIGN KEY (id_nationalite) REFERENCES NATIONALITES(id_nationalite),
    FOREIGN KEY (id_intervenant) REFERENCES INTERVENANTS(id_intervenant)
);

-- Création de la table RESERVATIONS
CREATE TABLE RESERVATIONS (
    id_reservation INT PRIMARY KEY,
    numadhe INT,
    numseance INT,
    nbplaces INT,
    a_paye DECIMAL(10, 2),
    id_moyen_paiement INT,
    FOREIGN KEY (id_moyen_paiement) REFERENCES MOYENS_PAIEMENT(id_moyen_paiement),
    FOREIGN KEY (numadhe) REFERENCES ADHERENTS(id_adherent),
    FOREIGN KEY (numseance) REFERENCES SEANCES(id_seance)
);

CREATE TABLE MOYENS_PAIEMENT (
    id_moyen_paiement INT PRIMARY KEY,
    nom_moyen_paiement VARCHAR(50) UNIQUE
);

-- Création de la table SEANCES
CREATE TABLE SEANCES (
    id_seance INT PRIMARY KEY,
    numfilm INT,
    numsalle INT,
    jour DATE,
    heuredeb TIME,
    FOREIGN KEY (numfilm) REFERENCES FILMS(id_film),
    FOREIGN KEY (numsalle) REFERENCES SALLES(id_salle)
);
