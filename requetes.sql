
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
SELECT DISTINCT genre
FROM GENRES;

