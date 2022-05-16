DROP TABLE IF EXISTS combined;

SELECT * INTO combined FROM red_wine
UNION
SELECT * FROM white_wine;

SELECT * FROM combined;