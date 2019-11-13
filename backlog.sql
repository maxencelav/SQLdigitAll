/* ---- EXERCICE 2 ---- */
CREATE USER 'lucas'@'localhost' IDENTIFIED BY '251067';
GRANT ALL PRIVILEGES ON * . * TO 'lucas'@'localhost';

CREATE USER 'maxence'@'localhost' IDENTIFIED BY 'motDePasse';
GRANT ALL PRIVILEGES ON * . * TO 'maxence'@'localhost';

/* ---- EXERCICE 3 ---- */

/* UTILISATEUR */

CREATE TABLE utilisateurs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mdp VARCHAR(100)NOT NULL,
    PRIMARY KEY (id)
)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/* VILLES DOMTOM*/

CREATE TABLE domtom(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    departement VARCHAR(50) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    port BOOLEAN,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB;

/* PERSONNES EN CHARGE DES BATEAUX */

CREATE TABLE  bateliers(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    pays_origine VARCHAR(50) NOT NULL,
    ville_origine VARCHAR(100) NOT NULL,
    debut_activite DATE NOT NULL,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB;

/* MATIERES PREMIERES ET DENREES ALIMENTAIRES */

CREATE TABLE matieres_denrees(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(65) NOT NULL,
    est_matiere_premiere BOOLEAN,
    date_disposition DATE NOT NULL,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB

/* CARGAISONS */

CREATE TABLE cargaisons(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pays_depart VARCHAR(50) NOT NULL,
    ville_depart VARCHAR(100) NOT NULL,
    date_heure_depart DATETIME NOT NULL,
    id_ville_arrive INT UNSIGNED NOT NULL,
    date_heure_arrive DATETIME NULL,
    reference_bateau VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cargaisons_domtom FOREIGN KEY (id_ville_arrive) REFERENCES domtom(id) ON DELETE CASCADE
)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/* ATTRIBUER MATIERES ET DENREES */

CREATE TABLE attrib(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_matiere_denree INT UNSIGNED NOT NULL,
    quantite INT(10) UNSIGNED NOT NULL,
    id_cargaison INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_attrib_matiere_denree FOREIGN KEY (id_matiere_denree) REFERENCES matieres_denrees(id) ON DELETE CASCADE,
    CONSTRAINT fk_attrib_cargaisons FOREIGN KEY (id_cargaison) REFERENCES cargaisons(id) ON DELETE CASCADE

)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/* DISTRIBUER MATIERES ET DENREES */

CREATE TABLE distrib(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_cargaison INT UNSIGNED NOT NULL,
    id_matiere_denree INT UNSIGNED NOT NULL,
    id_ville INT UNSIGNED NOT NULL,
    quantite_distribue INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_distrib_matieres_denrees FOREIGN KEY (id_matiere_denree) REFERENCES matieres_denrees(id) ON DELETE CASCADE,
    CONSTRAINT fk_distrib_cargaisons FOREIGN KEY (id_cargaison) REFERENCES cargaisons(id) ON DELETE CASCADE,
    CONSTRAINT fk_distrib_domtom FOREIGN KEY (id_ville) REFERENCES domtom(id) ON DELETE CASCADE
)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/* ---- EXERCICE 4 ---- */


/* ---- EXERCICE 5 ---- */


/* ---- EXERCICE 6 ---- */


/* ---- EXERCICE 7 ---- */


/* ---- EXERCICE 8 ---- */
