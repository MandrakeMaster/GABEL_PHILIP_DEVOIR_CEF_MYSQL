-- 1. Création et configuration de la base
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tifosi;

-- 2. Sécurité : Création d'un utilisateur dédié
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY '#Tifosi2026';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- 3. Tables "Parents" (pas de clés étrangères)
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(45) NOT NULL
);

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(45) NOT NULL
);

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(45) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(45) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

-- 4. Tables "Enfants" (dépendent des parents)
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(45) NOT NULL,
    id_marque INT NOT NULL,
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- 5. Tables Pivots (relations n,n)
CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT DEFAULT 0,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_fi_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_fi_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

CREATE TABLE menu_focaccia (
    id_menu INT NOT NULL,
    id_focaccia INT NOT NULL,
    PRIMARY KEY (id_menu, id_focaccia),
    CONSTRAINT fk_mf_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    CONSTRAINT fk_mf_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

CREATE TABLE menu_boisson (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_mb_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    CONSTRAINT fk_mb_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);