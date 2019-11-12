/*----EXERCICE 3----*/

/*utilisateur*/

CREATE TABLE utilisateur (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    mdp VARCHAR(100)NOT NULL,

)
CHARACTER SET 'utf8'
ENGINE = INNODB;

/*villes des DOMTOM*/

CREATE TABLE villes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    departement VARCHAR(50) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    code postal VARCHAR(5) NOT NULL,
    port_import_export BOOLEAN,
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
)

CHARACTER SET 'utf8'
ENGINE = INNODB;

/*les matières premières et les denrées alimentaires*/

CREATE TABLE matieres_premieres_et_denrees_alimentaire (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_matiere_denre VARCHAR(65) NOT NULL,
    matieres_premiere BOOLEAN,
    denre_alimentaire BOOLEAN,
    date_de_mise_a_disposition DATE NOT NULL,

)

CHARACTER SET 'utf8'
ENGINE = INNODB

/*les cargaisons*/

CREATE TABLE cargaisons(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pays_depart VARCHAR(50) NOT NULL,
    ville_depart VARCHAR(100) NOT NULL,
    date_heure_depart DATETIME
)