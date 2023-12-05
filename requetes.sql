
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
SELECT nom_salle
FROM SALLES
JOIN ADRESSE_SALLE ON SALLES.id_salle = ADRESSE_SALLE.id_salle
WHERE ADRESSE_SALLE.ville = 'Lille';

-- 5 Donnez la liste des différents genres de films.
SELECT DISTINCT genre
FROM GENRES;

