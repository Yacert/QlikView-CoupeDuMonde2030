CREATE DATABASE IF NOT EXISTS projet_qlik;
SHOW DATABASES;
USE projet_qlik;

CREATE TABLE dim_pays (
    id_pays INT PRIMARY KEY,
    nom_pays VARCHAR(50)
);

SELECT * FROM dim_pays;
SELECT COUNT(*) FROM dim_pays;


CREATE TABLE dim_stade (
    id_stade INT PRIMARY KEY,
    nom_stade VARCHAR(100),
    ville VARCHAR(50),
    capacite INT,
    cout_renovation BIGINT
);

SELECT * FROM dim_stade;
SELECT COUNT(*) FROM dim_stade;


CREATE TABLE dim_temps (
    id_temps INT PRIMARY KEY,
    annee INT,
    mois INT
);

SELECT * FROM dim_temps;
SELECT COUNT(*) FROM dim_temps;


CREATE TABLE fact_preparation_mondial (
    id_fact INT PRIMARY KEY,
    id_pays INT,
    id_stade INT,
    id_temps INT,
    investissements BIGINT,
    avancement_travaux_percent INT,
    emplois_crees INT,
    capacite_hotel INT,
    visiteurs_estimes INT,
    jours_restants INT,
    FOREIGN KEY (id_pays) REFERENCES dim_pays(id_pays),
    FOREIGN KEY (id_stade) REFERENCES dim_stade(id_stade),
    FOREIGN KEY (id_temps) REFERENCES dim_temps(id_temps)
);

SELECT * FROM fact_preparation_mondial;
SELECT COUNT(*) FROM fact_preparation_mondial;

-- Total des investissements par pays
SELECT p.nom_pays, SUM(f.investissements) AS total_investissements
FROM fact_preparation_mondial f
JOIN dim_pays p ON f.id_pays = p.id_pays
GROUP BY p.nom_pays;

-- Avancement moyen des travaux par stade
SELECT s.nom_stade, AVG(f.avancement_travaux_percent) AS avancement_moyen
FROM fact_preparation_mondial f
JOIN dim_stade s ON f.id_stade = s.id_stade
GROUP BY s.nom_stade;

-- Nombre total d’emplois créés par année
SELECT t.annee, SUM(f.emplois_crees) AS total_emplois
FROM fact_preparation_mondial f
JOIN dim_temps t ON f.id_temps = t.id_temps
GROUP BY t.annee;

