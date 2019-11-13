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
    telephone VARCHAR(14) NOT NULL,
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

INSERT INTO utilisateurs
VALUES (1, 'Torres', 'Philippe','philipe.torres@gmail.com','xJS€=J@57v9t2R!z'),
       (2, 'Verne','Jule','juleverne@yahoo.fr','vX]ky(9{YY68Vv4<'),
       (3, 'Dagenais','Gaston','GastonDagenais@dayrep.com','F@6q:a20=7tG}YJa'),
       (4, 'Gauthier','Fabien','FabienGauthier@rhyta.com','T7]wVyk3sQ(%0!B5'),
       (5, 'Jodoin','Madeleine','MadeleineJodoin@rhyta.com','Viw370XI.{/b9Pqµ');



/* ---- EXERCICE 5 ---- */
/* Liste des villes */
/* id, departement, ville, code postal, port */
INSERT INTO domtom
VALUES  (1,'La Réunion','Saint-Denis','97400',0),
        (2,'La Réunion','Le Tampon','97430',0),
        (3,'Guadeloupe','Pointe-à-Pitre','97110',1),
        (4,'La Réunion','Le Port','97420',1),
        (5,'Guyane','Rémire-Montjoly','97354',1),
        (6,'Guyane','Kourou','97310',0),
        (7,'Martinique','Case-Pilote','97222',0);


/* ---- EXERCICE 6 ---- */

INSERT INTO bateliers
VALUES (1, 'Lemieux','Eustache','0677841976','France','Dax','1987-05-13'),
       (2, 'Gladu','Stéphane','0618037000','France','Angers','2003-09-24'),
       (3, 'Hilton','Alexander','07934115066','Royaume-Uni','Birmingham','1997-11-16'),
       (4, 'Lucchese','Alvaro','03579717227','Italie','Milan','2004-02-11'),
       (5, 'Lorenzo','Guglielmo','03875223159','Italie','Naple','1980-04-28'),
       (6, 'Dixon','Daryl','802-221-0873','Etats-Unis','Dallas','1991-08-14'),
       (7, 'Davis','Manuel','270-394-7485','Etats-Unis','Los Angeles','1979-03-07'),
       (8, 'Brkić','Mijo','0480990376','Croatie','Zagreb','2000-06-17');

/* ---- EXERCICE 7 ---- */
/* id nom est_matiere_premiere date_disposition*/
INSERT INTO matieres_denrees
VALUES  (1,'Charbon',1,'2018-01-11'),
        (2,'Acier',1,'2018-01-15'),
        (3,'Pétrole',1,'2018-03-24'),
        (4,'Gaz',1,'2018-04-02'),
        (5,'Uranium',1,'2018-04-13'),
        (6,'Aluminium',1,'2018-05-17'),
        (7,'Fer',1,'2018-05-24'),
        (8,'Or',1,'2018-06-04'),
        (9,'Argent',1,'2018-07-07'),
        (10,'Platine',1,'2018-08-07'),
        (11,'Sable',1,'2018-10-20'),
        (12,'Gravier',1,'2018-11-06'),
        (13,'Argile',1,'2018-11-14'),
        (14,'Pierre',1,'2018-12-04'),
        (15,'Ardoise',1,'2019-01-20'),
        (16,'Calcaire',1,'2019-02-03'),
        (17,'Sel',1,'2019-06-23'),
        (18,'Caoutchouc',1,'2019-09-25'),
        (19,'Céréales',0,'2018-01-15'),
        (20,'Algues',0,'2018-01-29'),
        (21,'Lait',0,'2018-02-09'),
        (22,'Viande',0,'2018-02-27'),
        (23,'Aubergine',0,'2018-05-05'),
        (24,'Endive',0,'2018-06-12'),
        (25,'Fenouil',0,'2018-06-20'),
        (26,'Chou',0,'2018-06-26'),
        (27,'Tomate',0,'2018-09-15'),
        (28,'Pomme de Terre',0,'2019-09-29'),
        (29,'Carotte',0,'2019-06-11'),
        (30,'Poivre',0,'2019-03-16'),
        (31,'Cumin',0,'2019-12-24'),
        (32,'Mayonnaise',0,'2019-10-10'),
        (33,'Pain',0,'2019-04-16');


/* ---- EXERCICE 8 ---- */
