
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
SELECT DISTINCT id_nationalite
FROM INTERVENANTS
JOIN FILMS ON INTERVENANTS.id_intervenant = FILMS.id_film;

