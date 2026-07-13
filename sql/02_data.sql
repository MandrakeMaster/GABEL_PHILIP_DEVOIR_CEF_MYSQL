USE tifosi;

-- Désactivation des clés étrangères pour l'insertion
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Peuplement des MARQUES
INSERT INTO marque (id_marque, nom_marque) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- 2. Peuplement des INGREDIENTS
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES
(1, 'Ail'), (2, 'Ananas'), (3, 'Artichaut'), (4, 'Bacon'), (5, 'Base Tomate'),
(6, 'Base crème'), (7, 'Champignon'), (8, 'Chevre'), (9, 'Cresson'), (10, 'Emmental'),
(11, 'Gorgonzola'), (12, 'Jambon cuit'), (13, 'Jambon fumé'), (14, 'Oeuf'), (15, 'Oignon'),
(16, 'Olive noire'), (17, 'Olive verte'), (18, 'Parmesan'), (19, 'Piment'), (20, 'Poivre'),
(21, 'Pomme de terre'), (22, 'Raclette'), (23, 'Salami'), (24, 'Tomate cerise'), (25, 'Mozarella');

-- 3. Peuplement des BOISSONS
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES
(1, 'Coca-cola zéro', 1), (2, 'Coca-cola original', 1), (3, 'Fanta citron', 1),
(4, 'Fanta orange', 1), (5, 'Capri-sun', 1), (6, 'Pepsi', 4), (7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4), (9, 'Lipton Peach', 4), (10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3), (12, 'Eau de source', 2);

-- 4. Peuplement des FOCACCIAS
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES
(1, 'Mozaccia', 9.80), (2, 'Gorgonzollaccia', 10.80), (3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80), (5, 'Tradizione', 8.90), (6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80), (8, 'Paysanne', 12.80);

-- Réactivation des clés étrangères
SET FOREIGN_KEY_CHECKS = 1;