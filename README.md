# QlikView — Dashboard Coupe du Monde 2030

Projet de fin de module — Système d'information et BDD | ISMAGI 2025-2026

## Description
Dashboard interactif QlikView pour suivre la préparation de la Coupe du Monde 2030. Base de données MySQL (stades, pays, investissements, emplois, visiteurs) connectée via ODBC. 3 pages de visualisation : vue globale, analyse des stades, emplois et visiteurs. Filtres dynamiques et KPI interactifs.

## Technologies utilisées
- QlikView (dashboard interactif)
- MySQL / MySQL Workbench
- ODBC (connexion QlikView ↔ MySQL)
- Excel (préparation des données)

## Structure de la base de données
| Table | Description |
|-------|-------------|
| `dim_pays` | Pays participants (Maroc, Espagne, Portugal) |
| `dim_stade` | Stades (nom, ville, capacité, coût rénovation) |
| `dim_temps` | Années de préparation |
| `fact_preparation_mondial` | Investissements, emplois, visiteurs, avancement |

## Contenu du dashboard
- **Page 1** : Vue globale — avancement des travaux, investissements par pays
- **Page 2** : Analyse des stades — capacité, coût de rénovation, avancement
- **Page 3** : Emplois et visiteurs — emplois créés, capacité hôtelière, visiteurs estimés

## Fichiers
- `Coupe du monde 2030.qvw` — fichier QlikView principal
- `Projet Qlikview.sql` — script SQL de création de la base de données

## Réalisé par
- Yacert Ouattara
