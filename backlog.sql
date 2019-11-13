/*----EXERCICE 3----*/

/*utilisateur*/

CREATE TABLE utilisateur (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    mdp VARCHAR(100)NOT NULL,
    PRIMARY KEY (id)
)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/*villes des DOMTOM*/

CREATE TABLE ville (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    departement VARCHAR(50) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    code postal VARCHAR(5) NOT NULL,
    port_import_export BOOLEAN,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB;

/*les personnes en charges sur les bateaux de marchandises*/

CREATE TABLE  personne en charges(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    pays_origine VARCHAR(50) NOT NULL,
    ville_origine VARCHAR(100) NOT NULL,
    début_activité DATE NOT NULL,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB;

/*les matières premières et les denrées alimentaires*/

CREATE TABLE matiere_denree (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_matiere_denree VARCHAR(65) NOT NULL,
    est_matiere_premiere BOOLEAN,
    date_de_mise_a_disposition DATE NOT NULL,
    PRIMARY KEY (id)
)

CHARACTER SET 'utf8'
ENGINE = INNODB

/*les cargaisons*/

CREATE TABLE cargaisons(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pays_depart VARCHAR(50) NOT NULL,
    ville_depart VARCHAR(100) NOT NULL,
    date_heure_depart DATETIME
    id_ville_arrive INT UNSIGNED NOT NULL, 
    date_heure_arrive DATETIME NULL,
    reference_bateau VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
    CONSTRAINT fk_cargaisons_ville FOREIGN KEY (villes_id) REFERENCES villes(id) ON DELETE CASCADE
)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/*attribuer les matières premières et des denrées alimentaire*/

CREATE TABLE attrib(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_matiere_denree INT UNSIGNED NOT NULL,
    quantite INT(10) NOT NULL, 
    id_cargaison INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
    CONSTRAINT fk_attrib_matiere_denree FOREIGN KEY (matiere_denree_id) REFERENCES matiere_denree(id) ON DELETE CASCADE 
    CONSTRAINT fk_attrib_cargaison FOREIGN KEY (cargaisons_id) REFERENCES cargaison(id) ON DELETE CASCADE

)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/*Distribution des denrées et des matières par ville*/

CREATE TABLE distrib (
    id_cargaison INT UNSIGNED NOT NULL, 
    id_matiere_denree INT UNSIGNED NOT NULL,
    id_ville INT UNSIGNED NOT NULL,
    quantite_distribue INT(10) NOT NULL,
    CONSTRAINT fk_distrib_matiere_denree FOREIGN KEY (matiere_denree_id) REFERENCES matiere_denree(id) ON DELETE CASCADE 
    CONSTRAINT fk_distrib_cargaison FOREIGN KEY (cargaisons_id) REFERENCES cargaison(id) ON DELETE CASCADE
    CONSTRAINT fk_distrib_ville FOREIGN KEY (ville_id) REFERENCES ville(id) ON DELETE CASCADE


)
CHARACTER SET 'utf8'
ENGINE = INNODB;

