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

CREATE TABLE bateliers(
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
    reference_bateau VARCHAR(24) NOT NULL,
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

/* VALUES INSERT INTO `addresses_datas` (`id`, `region`, `department`, `zip`, `city`) VALUES */
INSERT INTO domtom
VALUES  (1, 'Nouvelle-Calédonie', '98800', 'NOUMEA',1),
        (2, 'Nouvelle-Calédonie', '98809', 'LE MONT DORE',0),
        (3, 'Nouvelle-Calédonie', '98811', 'BELEP',0),
        (4, 'Nouvelle-Calédonie', '98812', 'BOULOUPARI',0),
        (5, 'Nouvelle-Calédonie', '98813', 'CANALA',0),
        (6, 'Nouvelle-Calédonie', '98814', 'OUVEA',0),
        (7, 'Nouvelle-Calédonie', '98815', 'HIENGHENE',0),
        (8, 'Nouvelle-Calédonie', '98816', 'HOUAILOU',0),
        (9, 'Nouvelle-Calédonie', '98817', 'KAALA GOMEN',0),
        (10, 'Nouvelle-Calédonie', '98818', 'KOUAOUA',0),
        (11, 'Nouvelle-Calédonie', '98819', 'MOINDOU',0),
        (12, 'Nouvelle-Calédonie', '98820', 'LIFOU',0),
        (13, 'Nouvelle-Calédonie', '98821', 'OUEGOA',0),
        (14, 'Nouvelle-Calédonie', '98822', 'POINDIMIE',0),
        (15, 'Nouvelle-Calédonie', '98823', 'PONERIHOUEN',0),
        (16, 'Nouvelle-Calédonie', '98824', 'POUEBO',0),
        (17, 'Nouvelle-Calédonie', '98825', 'POUEMBOUT',0),
        (18, 'Nouvelle-Calédonie', '98826', 'POUM',0),
        (19, 'Nouvelle-Calédonie', '98827', 'POYA',0),
        (20, 'Nouvelle-Calédonie', '98828', 'MARE',0),
        (21, 'Nouvelle-Calédonie', '98829', 'THIO',0),
        (22, 'Nouvelle-Calédonie', '98830', 'DUMBEA',0),
        (23, 'Nouvelle-Calédonie', '98831', 'TOUHO',0),
        (24, 'Nouvelle-Calédonie', '98832', 'L ILE DES PINS',0),
        (25, 'Nouvelle-Calédonie', '98833', 'VOH',0,0),
        (26, 'Nouvelle-Calédonie', '98834', 'YATE',0),
        (27, 'Nouvelle-Calédonie', '98835', 'DUMBEA',0),
        (28, 'Nouvelle-Calédonie', '98838', 'HOUAILOU',0),
        (29, 'Nouvelle-Calédonie', '98840', 'PAITA',0),
        (30, 'Nouvelle-Calédonie', '98850', 'KOUMAC',0),
        (31, 'Nouvelle-Calédonie', '98859', 'KONE',0),
        (32, 'Nouvelle-Calédonie', '98870', 'BOURAIL',0),
        (33, 'Nouvelle-Calédonie', '98877', 'POYA',0),
        (34, 'Nouvelle-Calédonie', '98878', 'MARE',0),
        (35, 'Nouvelle-Calédonie', '98880', 'LA FOA',0),
        (36, 'Nouvelle-Calédonie', '98881', 'FARINO',0),
        (37, 'Nouvelle-Calédonie', '98882', 'SARRAMEA',0),
        (38, 'Nouvelle-Calédonie', '98883', 'VOH',0),
        (39, 'Nouvelle-Calédonie', '98884', 'LIFOU',0),
        (40, 'Nouvelle-Calédonie', '98890', 'PAITA',0),
        (41, 'Polynésie-Française', '98701', 'ARUE',0),
        (42, 'Polynésie-Française', '98703', 'PUNAAUIA',0),
        (43, 'Polynésie-Française', '98704', 'FAAA',0),
        (44, 'Polynésie-Française', '98705', 'HITIAA O TE RA',0),
        (45, 'Polynésie-Française', '98709', 'MAHINA',0),
        (46, 'Polynésie-Française', '98711', 'PAEA',0),
        (47, 'Polynésie-Française', '98712', 'PAPARA',0),
        (48, 'Polynésie-Française', '98714', 'PAPEETE',1),
        (49, 'Polynésie-Française', '98716', 'PIRAE',0),
        (50, 'Polynésie-Française', '98718', 'PUNAAUIA',0),
        (51, 'Polynésie-Française', '98719', 'TAIARAPU EST',0),
        (52, 'Polynésie-Française', '98723', 'TAIARAPU OUEST',0),
        (53, 'Polynésie-Française', '98726', 'TEVA I UTA',0),
        (54, 'Polynésie-Française', '98728', 'MOOREA MAIAO',0),
        (55, 'Polynésie-Française', '98730', 'BORA BORA',0),
        (56, 'Polynésie-Française', '98731', 'HUAHINE',0),
        (57, 'Polynésie-Française', '98732', 'MAUPITI',0),
        (58, 'Polynésie-Française', '98732', 'HUAHINE',0),
        (59, 'Polynésie-Française', '98732', 'MAUPITI',0),
        (60, 'Polynésie-Française', '98733', 'TAHAA',0),
        (61, 'Polynésie-Française', '98735', 'UTUROA',0),
        (62, 'Polynésie-Française', '98735', 'TAPUTAPUATEA',0),
        (63, 'Polynésie-Française', '98735', 'TUMARAA',0),
        (64, 'Polynésie-Française', '98740', 'FATU HIVA',0),
        (65, 'Polynésie-Française', '98741', 'HIVA OA',0),
        (66, 'Polynésie-Française', '98742', 'NUKU HIVA',0),
        (67, 'Polynésie-Française', '98743', 'TAHUATA',0),
        (68, 'Polynésie-Française', '98744', 'UA HUKA',0),
        (69, 'Polynésie-Française', '98745', 'UA POU',0),
        (70, 'Polynésie-Française', '98747', 'UA HUKA',0),
        (71, 'Polynésie-Française', '98748', 'NUKU HIVA',0),
        (72, 'Polynésie-Française', '98749', 'HIVA OA',0),
        (73, 'Polynésie-Française', '98750', 'RAIVAVAE',0),
        (74, 'Polynésie-Française', '98751', 'RAPA',0),
        (75, 'Polynésie-Française', '98752', 'RIMATARA',0),
        (76, 'Polynésie-Française', '98753', 'RURUTU',0),
        (77, 'Polynésie-Française', '98754', 'TUBUAI',0),
        (78, 'Polynésie-Française', '98755', 'GAMBIER',0),
        (79, 'Polynésie-Française', '98760', 'ANAA',0),
        (80, 'Polynésie-Française', '98761', 'ARUTUA',0),
        (81, 'Polynésie-Française', '98763', 'FAKARAVA',0),
        (82, 'Polynésie-Française', '98765', 'FANGATAU',0),
        (83, 'Polynésie-Française', '98767', 'HAO',0),
        (84, 'Polynésie-Française', '98768', 'HIKUERU',0),
        (84, 'Polynésie-Française', '98769', 'MAKEMO',0),
        (85, 'Polynésie-Française', '98770', 'MANIHI',0),
        (86, 'Polynésie-Française', '98772', 'NAPUKA',0),
        (87, 'Polynésie-Française', '98773', 'NUKUTAVAKE',0),
        (88, 'Polynésie-Française', '98774', 'PUKAPUKA',0),
        (89, 'Polynésie-Française', '98775', 'RANGIROA',0),
        (90, 'Polynésie-Française', '98779', 'REAO',0),
        (91, 'Polynésie-Française', '98781', 'TAKAROA',0),
        (92, 'Polynésie-Française', '98783', 'TATAKOTO',0),
        (93, 'Polynésie-Française', '98784', 'TUREIA',0),
        (94, 'Polynésie-Française', '98786', 'ANAA',0),
        (95, 'Polynésie-Française', '98787', 'FAKARAVA',0),
        (96, 'Polynésie-Française', '98788', 'NUKUTAVAKE',0),
        (97, 'Polynésie-Française', '98789', 'MAKEMO',0),
        (98, 'Polynésie-Française', '98790', 'FAKARAVA',0),
        (99, 'Polynésie-Française', '98790', 'HIKUERU',0),
        (100, 'Polynésie-Française', '98792', 'GAMBIER',0),
        (101, 'Polynésie-Française', '98794', 'RAPA',0),
        (102, 'Polynésie-Française', '98795', 'RIMATARA',0),
        (103, 'Polynésie-Française', '98796', 'NUKU HIVA',0),
        (104, 'Polynésie-Française', '98796', 'HIVA OA',0),
        (105, 'Polynésie-Française', '98799', 'ILE DE CLIPPERTON',0),
        (106, 'Wallis et Futuna', '98600', 'UVEA',0),
        (107, 'Wallis et Futuna', '98610', 'ALO',0),
        (108, 'Wallis et Futuna', '98620', 'SIGAVE',0),
        (109, 'Mayotte', '97600', 'MAMOUDZOU',0),
        (110, 'Mayotte', '97600', 'KOUNGOU',0),
        (111, 'Mayotte', '97615', 'DZAOUDZI',0),
        (112, 'Mayotte', '97615', 'PAMANDZI',1),
<<<<<<< HEAD
        (113, 'Mayotte', '97620', 'BOUENI',0),
        (114, 'Mayotte', '97620', 'CHIRONGUI',0),
        (115, 'Mayotte', '97625', 'KANI KELI',0),
        (116, 'Mayotte', '97630', 'MTSAMBORO',0),
        (117, 'Mayotte', '97630', 'ACOUA',0),
        (118, 'Mayotte', '97640', 'SADA',0),
        (119, 'Mayotte', '97650', 'BANDRABOUA',0),
        (120, 'Mayotte', '97650', 'M TSANGAMOUJI',0),
        (121, 'Mayotte', '97660', 'DEMBENI',0),
        (122, 'Mayotte', '97660', 'BANDRELE',0),
        (123, 'Mayotte', '97670', 'CHICONI',0),
        (124, 'Mayotte', '97670', 'OUANGANI',0),
        (125, 'Mayotte', '97680', 'TSINGONI'),
        (126, 'Saint-Pierre-et-Miquelon', '97500', 'MIQUELON LANGLADE'),
=======
        (113, 'Mayotte', '97620', 'BOUENI'),
        (114, 'Mayotte', '97620', 'CHIRONGUI'),
        (115, 'Mayotte', '97625', 'KANI KELI'),
        (116, 'Mayotte', '97630', 'MTSAMBORO'),
        (117, 'Mayotte', '97630', 'ACOUA'),
        (118, 'Mayotte', '97640', 'SADA'),
        (119, 'Mayotte', '97650', 'BANDRABOUA'),
        (120, 'Mayotte', '97650', 'M TSANGAMOUJI'),
        (121, 'Mayotte', '97660', 'DEMBENI'),
        (122, 'Mayotte', '97660', 'BANDRELE'),
        (123, 'Mayotte', '97670', 'CHICONI'),
        (124, 'Mayotte', '97670', 'OUANGANI'),
        (125, 'Mayotte', '97680', 'TSINGONI',0),
        (126, 'Saint-Pierre-et-Miquelon', '97500', 'MIQUELON LANGLADE',0),
>>>>>>> ee1ff52ea230c9970f376f3671f0b6199fa19eed
        (127, 'Saint-Pierre-et-Miquelon', '97500', 'ST PIERRE',1),
        (128, 'La Réunion', '97400', 'ST DENIS',0),
        (129, 'La Réunion', '97410', 'ST PIERRE', 1),
        (130, 'La Réunion', '97411', 'ST PAUL',0),
        (131, 'La Réunion', '97412', 'BRAS PANON',0),
        (132, 'La Réunion', '97413', 'CILAOS',0),
        (133, 'La Réunion', '97414', 'ENTRE DEUX',0),
        (134, 'La Réunion', '97416', 'ST LEU',0),
        (135, 'La Réunion', '97418', 'LE TAMPON',0),
        (136, 'La Réunion', '97419', 'LA POSSESSION',0),
        (137, 'La Réunion', '97420', 'LE PORT',1),
        (138, 'La Réunion', '97425', 'LES AVIRONS',0),
        (139, 'La Réunion', '97426', 'LES TROIS BASSINS',0),
        (140, 'La Réunion', '97427', 'L ETANG SALE',0),
        (141, 'La Réunion', '97429', 'PETITE ILE',0),
        (142, 'La Réunion', '97431', 'LA PLAINE DES PALMISTES',0),
        (143, 'La Réunion', '97432', 'ST PIERRE',0),
        (144, 'La Réunion', '97433', 'SALAZIE',0),
        (145, 'La Réunion', '97437', 'ST BENOIT',0),
        (146, 'La Réunion', '97438', 'STE MARIE',0),
        (147, 'La Réunion', '97439', 'STE ROSE',0),
        (148, 'La Réunion', '97440', 'ST ANDRE',0),
        (149, 'La Réunion', '97441', 'STE SUZANNE',0),
        (150, 'La Réunion', '97442', 'ST PHILIPPE',0),
        (151, 'La Réunion', '97450', 'ST LOUIS',0),
        (152, 'La Réunion', '97470', 'ST BENOIT',0),
        (153, 'La Réunion', '97480', 'ST JOSEPH',0),
        (154, 'Guyane', '97300', 'CAYENNE',1),
        (155, 'Guyane', '97310', 'KOUROU',1),
        (156, 'Guyane', '97311', 'ROURA',0),
        (157, 'Guyane', '97312', 'ST ELIE',0),
        (158, 'Guyane', '97313', 'ST GEORGES',0),
        (159, 'Guyane', '97314', 'SAUL',0),
        (160, 'Guyane', '97315', 'SINNAMARY',0),
        (161, 'Guyane', '97316', 'PAPAICHTON',0),
        (162, 'Guyane', '97317', 'APATOU',0),
        (163, 'Guyane', '97318', 'MANA',0),
        (164, 'Guyane', '97319', 'AWALA YALIMAPO',0),
        (165, 'Guyane', '97320', 'ST LAURENT DU MARONI',0),
        (166, 'Guyane', '97330', 'CAMOPI',0),
        (167, 'Guyane', '97340', 'GRAND SANTI',0),
        (168, 'Guyane', '97350', 'IRACOUBO',0),
        (169, 'Guyane', '97351', 'MATOURY',0),
        (170, 'Guyane', '97352', 'ROURA',0),
        (171, 'Guyane', '97353', 'REGINA',0),
        (172, 'Guyane', '97354', 'REMIRE MONTJOLY',0),
        (173, 'Guyane', '97355', 'MACOURIA',0),
        (174, 'Guyane', '97356', 'MONTSINERY TONNEGRANDE',0),
        (175, 'Guyane', '97360', 'MANA',0),
        (176, 'Guyane', '97370', 'MARIPASOULA',0),
        (177, 'Guyane', '97380', 'OUANARY',0),
        (178, 'Guyane', '97390', 'REGINA',0),
        (179, 'Martinique', '97200', 'FORT DE FRANCE',1),
        (180, 'Martinique', '97211', 'RIVIERE PILOTE'),
        (181, 'Martinique', '97212', 'ST JOSEPH',0),
        (182, 'Martinique', '97213', 'GROS MORNE',0),
        (183, 'Martinique', '97214', 'LE LORRAIN',0),
        (184, 'Martinique', '97215', 'RIVIERE SALEE',0),
        (185, 'Martinique', '97215', 'RIVIERE SALEE',0),
        (186, 'Martinique', '97216', 'L AJOUPA BOUILLON',0),
        (187, 'Martinique', '97217', 'LES ANSES D ARLET',1),
        (188, 'Martinique', '97218', 'MACOUBA',0),
        (189, 'Martinique', '97218', 'GRAND RIVIERE',1),
        (190, 'Martinique', '97218', 'BASSE POINTE',0),
        (191, 'Martinique', '97220', 'LA TRINITE',1),
        (192, 'Martinique', '97221', 'LE CARBET',0),
        (193, 'Martinique', '97222', 'BELLEFONTAINE',0),
        (194, 'Martinique', '97222', 'CASE PILOTE',1),
        (195, 'Martinique', '97223', 'LE DIAMANT',1),
        (196, 'Martinique', '97224', 'DUCOS',0),
        (197, 'Martinique', '97225', 'LE MARIGOT',1),
        (198, 'Martinique', '97226', 'LE MORNE VERT',0),
        (199, 'Martinique', '97227', 'STE ANNE',0),
        (200, 'Martinique', '97228', 'STE LUCE',0),
        (201, 'Martinique', '97229', 'LES TROIS ILETS',0),
        (202, 'Martinique', '97230', 'STE MARIE',0),
        (203, 'Martinique', '97231', 'LE ROBERT',1),
        (204, 'Martinique', '97232', 'LE LAMENTIN',1),
        (205, 'Martinique', '97233', 'SCHOELCHER',0),
        (206, 'Martinique', '97234', 'FORT DE FRANCE',0),
        (207, 'Martinique', '97240', 'LE FRANCOIS',1),
        (208, 'Martinique', '97250', 'LE PRECHEUR',0),
        (209, 'Martinique', '97250', 'FONDS ST DENIS',0),
        (210, 'Martinique', '97250', 'ST PIERRE',0),
        (211, 'Martinique', '97260', 'LE MORNE ROUGE',0),
        (212, 'Martinique', '97270', 'ST ESPRIT',0),
        (213, 'Martinique', '97280', 'LE VAUCLIN',1),
        (214, 'Martinique', '97290', 'LE MARIN',1),
        (215, 'Guadeloupe', '97100', 'BASSE TERRE',0),
        (216, 'Guadeloupe', '97110', 'POINTE A PITRE',1),
        (217, 'Guadeloupe', '97111', 'MORNE A L EAU',0),
        (218, 'Guadeloupe', '97112', 'GRAND BOURG',0),
        (219, 'Guadeloupe', '97113', 'GOURBEYRE',0),
        (220, 'Guadeloupe', '97114', 'TROIS RIVIERES',0),
        (221, 'Guadeloupe', '97115', 'STE ROSE',0),
        (222, 'Guadeloupe', '97116', 'POINTE NOIRE',0),
        (223, 'Guadeloupe', '97117', 'PORT LOUIS',0),
        (224, 'Guadeloupe', '97118', 'ST FRANCOIS',1),
        (225, 'Guadeloupe', '97119', 'VIEUX HABITANTS',0),
        (226, 'Guadeloupe', '97120', 'ST CLAUDE',0),
        (227, 'Guadeloupe', '97121', 'ANSE BERTRAND',0),
        (228, 'Guadeloupe', '97122', 'BAIE MAHAULT',0),
        (229, 'Guadeloupe', '97123', 'BAILLIF',0),
        (230, 'Guadeloupe', '97125', 'BOUILLANTE',0),
        (231, 'Guadeloupe', '97125', 'BOUILLANTE',0),
        (232, 'Guadeloupe', '97126', 'DESHAIES',0),
        (233, 'Guadeloupe', '97127', 'LA DESIRADE',0),
        (234, 'Guadeloupe', '97128', 'GOYAVE',0),
        (235, 'Guadeloupe', '97129', 'LAMENTIN',0),
        (236, 'Guadeloupe', '97130', 'CAPESTERRE BELLE EAU',0),
        (237, 'Guadeloupe', '97131', 'PETIT CANAL',0),
        (238, 'Guadeloupe', '97133', 'ST BARTHELEMY',0),
        (239, 'Guadeloupe', '97134', 'ST LOUIS',0),
        (240, 'Guadeloupe', '97136', 'TERRE DE BAS',0),
        (241, 'Guadeloupe', '97137', 'TERRE DE HAUT',0),
        (242, 'Guadeloupe', '97139', 'LES ABYMES',0),
        (243, 'Guadeloupe', '97140', 'CAPESTERRE DE MARIE GALANTE',0),
        (244, 'Guadeloupe', '97141', 'VIEUX FORT',0),
        (245, 'Guadeloupe', '97142', 'LES ABYMES',0),
        (246, 'Guadeloupe', '97150', 'ST MARTIN',0),
        (247, 'Guadeloupe', '97160', 'LE MOULE',0),
        (248, 'Guadeloupe', '97170', 'PETIT BOURG',0),
        (249, 'Guadeloupe', '97180', 'STE ANNE',0),
        (250, 'Guadeloupe', '97190', 'LE GOSIER',0);

/* ---- EXERCICE 6 ---- */

INSERT INTO bateliers
VALUES (1, 'Lemieux','Eustache','0677841976','France','Dax','1987-05-13'),
       (2, 'Gladu','Stéphane','0618037000','France','Angers','2003-09-24'),
       (3, 'Hilton','Alexander','07934115066','Royaume-Uni','Birmingham','1997-11-16'),
       (4, 'Lucchese','Alvaro','03579717227','Italie','Milan','2004-02-11'),
       (5, 'Lorenzo','Guglielmo','03875223159','Italie','Naples','1980-04-28'),
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

INSERT INTO cargaisons
VALUES (1, 'France','Bordeaux','2018-05-13 15:30:00',5,'2018-05-27 20:00:00','FR-IRIB8354D517'),/*viande*/
       (2, 'Italie','Palerme','2019-08-16 12:00:00',3,'2019-08-31 10:00:00','IT-CSICC1634I1018'),/*carotte*/
       (3, 'France','Le Havre','2019-01-12 14:00:00',3,'2019-01-29 14:45:00','FR-DSMEC0045G718'),/*fer*/
       (4, 'France','Nantes','2019-10-05 10:00:00',4,'2019-10-20 13:00:00','FR-IRIN7812A311'),/*Calcaire*/
       (5, 'Belgique','Bruges','2019-11-22 06:30:00',5,'2019-12-13 23:30:00','BE-SEPIU4678B919'),/*Poivre*/
       (6, 'Etats-Unis','New York','2018-07-14 22:00:00',5,'2018-07-30 03:30:00','US-BAEK4332L817'),/*pétrole*/
       (7, 'Espagne','Barcelone','2018-03-25 17:30:00',4,'2018-04-05 08:20:00','ESP-SEPIE4997H920'),/*Céréales*/
       (8, 'Etats-Unis','Miami','2019-01-29 11:00:00',4,'2019-03-03 12:30:00','US-BAET9855B718'),/*Tomate*/
       (9, 'Royaume-Uni','Liverpool','2019-02-05 20:45:00',3,'2019-02-20 18:35:00','GB-BAEB6654E416'),/*Argile*/
       (10, 'Royaume-Uni','Liverpool','2018-07-24 14:45:00',5,'2018-08-09 04:15:00','GB-BAEC0065J617');/*Charbon*/

/* ---- EXERCICE 9 ---- */

INSERT INTO attrib
Values (1,21,'328',1),
       (2,23,'2762',1),
       (3,7,'4799',1),
       (4,2,'1949',2),
       (5,11,'3301',2),
       (7,3,'3631',2),
       (8,13,'4131',3),
       (9,28,'2222',3),
       (10,7,'2706',3),
       (11,23,'2355',4),
       (12,22,'2851',4),
       (13,16,'336',4),
       (14,4,'4613',5),
       (15,18,'2662',5),
       (16,29,'4363',5),
       (17,33,'1567',6),
       (18,25,'4247',6),
       (19,17,'1116',6),
       (20,31,'4530',7),
       (21,12,'1567',7),
       (22,21,'4247',7),
       (23,32,'1116',8),
       (24,6,'4227',8),
       (25,24,'2335',8),
       (26,15,'1884',9),
       (27,20,'2016',9),
       (28,1,'3483',9),
       (29,30,'1920',10),
       (30,26,'3225',10);
       
       

       
       
