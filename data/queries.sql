-- Create tables for TNK-WineDB

CREATE TABLE winequality_goodvsbad (
    quality VARCHAR(2) NOT NULL,
	type VARCHAR(6) NOT NULL,
	class VARCHAR(5) NOT NULL
);

SELECT * FROM winequality_goodvsbad;