
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