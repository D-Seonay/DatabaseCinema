
-- 1 Sélectionne tous les films et les trie par titre de manière ascendante
SELECT *
FROM FILMS
ORDER BY titre ASC;

-- 2 Donnez la liste des nationalités des intervenants.
SELECT id_nationalite
FROM INTERVENANTS;

-- 3 Quels sont les comédies de moins de 120 mn.
SELECT titre
FROM FILMS
WHERE id_sous_genre = 3 AND duree < 120;

-- 4 Donnez la liste des salles de Lille.
SELECT ville
FROM SALLES
JOIN ADRESSES_SALLES ON SALLES.id_salle = ADRESSES_SALLES.id_salle
WHERE ADRESSES_SALLES.ville = 'Lille';

-- 5 Donnez la liste des différents genres de films.
SELECT DISTINCT nom_genre
FROM GENRE;

-- 6 Quels sont les adhérents qui n’ont pas encore payé leur cotisation.
SELECT nom, prenom
FROM ADHERENTS
WHERE paiement_cotis = 0;

-- 7 Donnez la liste des films dont le titre contient “la”, sans respect de la casse.
SELECT titre
FROM FILMS
WHERE UPPER(titre) LIKE '%LA%';

-- 8 Quelles sont les intervenants dont la nationalité est autre que française, américaine ou britannique, et dont le nom contient la lettre “R” (sans respect de la casse).
SELECT *
FROM INTERVENANTS
WHERE id_nationalite NOT IN ('FRA', 'USA', 'GBR')
    AND LOWER(nom) LIKE '%r%';

-- 9 Donnez la liste des séances du 20/12/07 comprises entre 18 et 21 heures.
SELECT *
FROM SEANCES
WHERE jour = '2007-12-20'
    AND heuredeb BETWEEN '18:00:00' AND '21:00:00';

-- 10 Donnez la durée des films en heures et minutes en utilisant des opérations arithmétiques pour réaliser la conversion
SELECT 
    titre,
    CONCAT(
        FLOOR(duree / 60), 'h ',
        duree % 60, 'min'
    ) AS duree_convertie
FROM FILMS;

-- 11. Donnez les durées minimale, moyenne et maximale des films.
SELECT 
    MIN(duree) AS duree_minimale,
    AVG(duree) AS duree_moyenne,
    MAX(duree) AS duree_maximale
FROM FILMS;

-- 12. Donnez le compte du nombre d’intervenants, classé par nationalités différentes.

SELECT id_nationalite, COUNT(*) AS nombre_intervenants
FROM INTERVENANTS
GROUP BY id_nationalite;


-- 13. Quel est le nombre d’adhérents par ville.

SELECT id_nationalite, COUNT(*) AS nombre_intervenants
FROM INTERVENANTS
GROUP BY id_nationalite;
SELECT ville, COUNT(*) AS nombre_adherents
FROM ADHERENTS
GROUP BY ville;

-- 14. Donnez le nombre de femmes parmi les intervenants

SELECT COUNT(*) AS nombre_femmes
FROM INTERVENANTS
WHERE sexe = 'F';

-- 15. Donnez de nombre de films correspondant à chaque genre, selon l’ordre décroissant

SELECT nom_genre, COUNT() AS nombre_films
FROM GENRE
JOIN FILMS ON GENRE.id_genre = FILMS.id_genre
GROUP BY nom_genre
ORDER BY COUNT() DESC;

-- 16 Donnez la liste des comédies françaises.
SELECT titre
FROM FILMS
JOIN SOUS_GENRE ON FILMS.id_sous_genre = SOUS_GENRE.id_sous_genre
JOIN GENRE ON SOUS_GENRE.id_genre = GENRE.id_genre
WHERE nom_genre = 'Comédie' AND id_nationalite = 'FRA';

-- 17 Donnez la liste des nationalités des réalisateurs.
SELECT DISTINCT INTERVENANTS.id_nationalite
FROM INTERVENANTS
JOIN FILMS ON INTERVENANTS.id_intervenant = FILMS.id_film;

-- 18 Donnez la liste des films français qui passent à l’UGC.
SELECT FILMS.titre
FROM FILMS
JOIN PRODUCTION ON FILMS.id_film = PRODUCTION.numfilm
JOIN SEANCES ON FILMS.id_film = SEANCES.numfilm
JOIN SALLES ON SEANCES.numsalle = SALLES.id_salle
WHERE PRODUCTION.id_nationalite = 'FR'
AND SALLES.nom = 'UGC';

-- 19 Donnez la liste des homonymes parmi les intervenants.
SELECT nom, prenom
FROM INTERVENANTS
GROUP BY nom, prenom
HAVING COUNT(*) > 1;

-- 20 Donnez la liste des films de Spielberg.
SELECT titre
FROM FILMS
JOIN PRODUCTION ON FILMS.id_film = PRODUCTION.numfilm
JOIN INTERVENANTS ON PRODUCTION.id_production = INTERVENANTS.id_intervenant
WHERE INTERVENANTS.nom = 'Spielberg';

-- 21 Donnez la liste des films dans lesquels joue Audrey Tautou.
SELECT titre
FROM FILMS
JOIN PRODUCTION ON FILMS.id_film = PRODUCTION.numfilm
JOIN INTERVENANTS ON PRODUCTION.id_production = INTERVENANTS.id_intervenant
WHERE INTERVENANTS.nom = 'Tautou' AND INTERVENANTS.prenom = 'Audrey';

-- 22 Donnez la liste des adhérents ayant réservé pour “Gladiator ”.
SELECT nom, prenom
FROM ADHERENTS
JOIN RESERVATIONS ON ADHERENTS.id_adherent = RESERVATIONS.id_adherent
JOIN SEANCES ON RESERVATIONS.id_reservation = SEANCES.id_reservation
JOIN FILMS ON SEANCES.numfilm = FILMS.id_film
WHERE FILMS.titre = 'Gladiator';

-- 23 Donnez le nombre de personnes ayant effectué une réservation pour une séance à l’UGC.
SELECT COUNT(*) AS nombre_reservations
FROM RESERVATIONS
JOIN SEANCES ON RESERVATIONS.id_reservation = SEANCES.id_reservation
JOIN SALLES ON SEANCES.numsalle = SALLES.id_salle
WHERE SALLES.nom = 'UGC';

-- 24 Donnez le nom des réalisateurs ayant plus d’un film stocké dans la base.
SELECT INTERVENANTS.nom
FROM INTERVENANTS
JOIN PRODUCTION ON INTERVENANTS.id_intervenant = PRODUCTION.id_intervenant
GROUP BY INTERVENANTS.nom
HAVING COUNT(*) > 1;

-- 25 Donnez la liste des séances ayant lieu au Mélies 2 jours après celles du 19 décembre.
SELECT *
FROM SEANCES
JOIN SALLES ON SEANCES.numsalle = SALLES.id_salle
WHERE SALLES.nom = 'Mélies'
AND SEANCES.jour = '2007-12-21';

-- 26 Donnez, avec leur titre, l’heure exacte de début et de fin des films, classés par jour et par heure de début.
SELECT titre, CONCAT(jour, ' ', heuredeb) AS debut, CONCAT(jour, ' ', heuredeb + INTERVAL duree MINUTE) AS fin
FROM FILMS
JOIN SEANCES ON FILMS.id_film = SEANCES.numfilm
ORDER BY jour, heuredeb;

-- 27 Donnez la liste des couples d’acteurs français (un homme et une femme), sans répétition.

SELECT DISTINCT INTERVENANTS.nom, INTERVENANTS.prenom
FROM INTERVENANTS
JOIN PRODUCTION ON INTERVENANTS.id_intervenant = PRODUCTION.id_intervenant
JOIN FILMS ON PRODUCTION.numfilm = FILMS.id_film
WHERE INTERVENANTS.sexe = 'F' AND PRODUCTION.id_nationalite = 'FR';

-- 28 Donnez le nombre d’actrices dans les films américains.
SELECT COUNT(*) AS nombre_actrices
FROM INTERVENANTS
JOIN PRODUCTION ON INTERVENANTS.id_intervenant = PRODUCTION.id_intervenant
JOIN FILMS ON PRODUCTION.numfilm = FILMS.id_film
WHERE INTERVENANTS.sexe = 'F' AND PRODUCTION.id_nationalite = 'USA';

-- 29 Donnez le nombre de films par catégorie
SELECT nom_genre, COUNT(*) AS nombre_films
FROM GENRE
JOIN FILMS ON GENRE.id_genre = FILMS.id_genre
GROUP BY nom_genre;

-- 30 Donnez le nombre d’acteurs enregistrés dans la base et intervenant dans le film Ocean’s eleven.

SELECT COUNT(*) AS nombre_acteurs
FROM INTERVENANTS
JOIN PRODUCTION ON INTERVENANTS.id_intervenant = PRODUCTION.id_intervenant
JOIN FILMS ON PRODUCTION.numfilm = FILMS.id_film
WHERE INTERVENANTS.sexe = 'M' AND FILMS.titre = 'Ocean''s eleven';

-- 31 Les réservations doivent être payées à J-4 au plus tard. Quelle est la date limite de réception des paiements, sous la forme jour/mois/année(4 chiffres) ?

SELECT DATE_SUB(jour, INTERVAL 4 DAY) AS date_limite
FROM SEANCES;


-- 32 Donnez la durée des films en heures et minutes en utilisant des fonctions de conversion chaı̂Rne-date, avec les formats appropriés, pour réaliser la conversion.

SELECT titre, SEC_TO_TIME(duree * 60) AS duree_convertie
FROM FILMS;

