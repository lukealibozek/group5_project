DROP TABLE IF EXISTS red_wine;
DROP TABLE IF EXISTS white_wine;  

CREATE TABLE red_wine (
  id VARCHAR(255) PRIMARY KEY NOT NULL,
  fixed_acidity REAL,
  volatile_acidity REAL,
  citric_acid REAL,
  residual_sugar REAL,
  chlorides REAL,
  free_sulfur_dioxide REAL,
  total_sulfur_dioxide REAL,
  density REAL,
  pH REAL,
  sulphates REAL,
  alcohol REAL,
  quality INT ,
  type VARCHAR(255) ,
  class VARCHAR(255) 
);

CREATE TABLE white_wine (
  id VARCHAR(255) PRIMARY KEY NOT NULL,
  fixed_acidity REAL,
  volatile_acidity REAL,
  citric_acid REAL,
  residual_sugar REAL,
  chlorides REAL,
  free_sulfur_dioxide REAL,
  total_sulfur_dioxide REAL,
  density REAL,
  pH REAL,
  sulphates REAL,
  alcohol REAL,
  quality INT ,
  type VARCHAR(255) ,
  class VARCHAR(255) 
);
