USE tifosi;

-- 1. Focaccias par ordre alphabétique
-- But : Lister les noms de focaccias par ordre croissant
SELECT nom FROM focaccia ORDER BY nom ASC;

-- 2. Nombre total d'ingrédients
-- But : Compter tous les ingrédients disponibles
SELECT COUNT(*) AS total_ingredients FROM ingredient;

-- 3. Prix moyen des focaccias
-- But : Calculer la moyenne des prix
SELECT AVG(prix) AS prix_moyen FROM focaccia;

-- 4. Boissons avec leur marque
-- But : Lister les boissons et leur marque liée
SELECT b.nom, m.nom 
FROM boisson b 
JOIN marque m ON b.id_marque = m.id_marque 
ORDER BY b.nom ASC;

-- 5. Ingrédients pour une Raclaccia (avec leurs quantités)
-- But : Lister les ingrédients de la 'Raclaccia' et leur quantité en grammes
SELECT i.nom, fi.quantite 
FROM ingredient i
JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
JOIN focaccia f ON fi.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';

-- 6. Nombre d'ingrédients par focaccia
-- But : Compter les ingrédients pour chaque focaccia
SELECT f.nom, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia;

-- 7. Focaccia avec le plus d'ingrédients
-- But : Trouver la focaccia la plus riche
SELECT f.nom, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia
ORDER BY nb_ingredients DESC LIMIT 1;

-- 8. Focaccias contenant de l'ail
-- But : Lister les focaccias avec l'ingrédient 'Ail'
SELECT f.nom FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';

-- 9. Ingrédients inutilisés
-- But : Lister les ingrédients qui ne sont dans aucune focaccia
SELECT nom FROM ingredient WHERE id_ingredient NOT IN (SELECT id_ingredient FROM focaccia_ingredient);

-- 10. Focaccias sans champignon
-- But : Lister les focaccias qui ne contiennent pas de champignon
SELECT nom FROM focaccia WHERE id_focaccia NOT IN (
    SELECT fi.id_focaccia FROM focaccia_ingredient fi
    JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);