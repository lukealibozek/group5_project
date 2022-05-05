# Wine Quality Analysis

For this project ....

## Sources

The data sources used for this analysis were pulled from UCI's machine learning repository, donated by Paulo Cortez of the University of Minho, Portugal (P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis).
- **Wine Quality Datasets** [(view)](http://www3.dsi.uminho.pt/pcortez/wine/)

The data relates to red and white Vinho Verde wine samples, and their physicochemical properties.

## EDA

To clean this dataset we will:
- Check for null values
- Check data types
- Append a wine type to each dataset (red / white)
- Append a column for wine classification (binary, good / bad based on a certain quality threshold)
- Create a union of both tables to conduct testing across both datasets.
  
## Database
- Use QuickDB to draft up the database structure
- Use Postgres for the database
-


## Model

For this project we will use Ensemble Learners to predict the wine classification, as well as determining feature importance to assess which feature is more responsible for determining quality.

## The Question(s)

This project will aim to determine the following:
1. Is a "Good" wine able to be predicted via the analysis of a wine's physicochemical properties? 
2. What physicochemical features are most responsible for determining wine quality?
3. Can a wine quality evaluation be conducted agnostic of wine type (red or white), or do such evaluations need to remain segregated by type?


