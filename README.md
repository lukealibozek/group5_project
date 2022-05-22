# Wine Quality Analysis

For this project we aim to assess wine quality, and whether it is possible to classify a wine based on its chemical properties.

## Data Sources

The data sources used for this analysis were pulled from UCI's machine learning repository, donated by Paulo Cortez of the University of Minho, Portugal (P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis).
- **Wine Quality Datasets** [(view)](http://www3.dsi.uminho.pt/pcortez/wine/)

The data relates to red and white Vinho Verde wine samples, and their physicochemical properties.

## Overview: Questions we hope to answer

This project will aim to determine the following:
1. Is a "Good" wine able to be predicted via the analysis of a wine's physicochemical properties? 
2. What physicochemical features are most responsible for determining wine quality?
3. Can a 'good' wine be predicted using a chemical analysis agnostic of wine type (red or white)?


## Analysis

### Data Cleaning

The dataset was originally in the form of two CSV's - one for red wine, one for white:

![](resources/df_example.png)

The data types were assessed, in addition to checking for Null/NA values.

![](resources/data_cleaning.png)

### Data Exploration, Pre-Processing

**Quality Score Distribution Analysis**

A column denoting wine type (red or white) was added to each dataframe. 

```python
df_red["type"] = 'red'
df_white["type"] = 'white'
```

The distribution of wine quality was assessed by creating a new dataframe using normalized value counts (quality scores represented as percentages of total wine counts).

Based on this analysis, a **quality threshold was set at 6**.

```python
# Count number of values per score, per wine type (normalize creates a percent of total value)
red_quality = df_red['quality'].value_counts(normalize=True)
white_quality = df_white['quality'].value_counts(normalize=True)

# Create emplty DF for both wine types, and quality scores from 1 to 10
quality_perc = pd.DataFrame(columns=('Red','White'),index=list(range(1,11)))

# Input quality counts to DF
quality_perc['Red'] = red_quality
quality_perc['White'] = white_quality

# Fill blanks with 0's
quality_perc.fillna(0,inplace=True)
```

![](resources/quality_table.png)

![](resources/Quality_distro.png)

![](resources/Q-thresh-good.png)  

**Adding a Classification Column**

Based on this determination, a new column was added to each dataset to denote good/bad classification. 

```python
df_red['class'] = ['good' if x >=q_thresh else 'bad' for x in df_red['quality']]
df_white['class'] = ['good' if x >=q_thresh else 'bad' for x in df_white['quality']]
```

### Database: Create Tables

A postgres database was created using pgAdmin.

```python
# load .env for database password
load_dotenv()
password = os.environ.get('PASS2')

# connect to database
db_path = f'postgresql://postgres:{password}@127.0.0.1:5432/wine_quality'
engine = create_engine(db_path, echo=False)

# write DFs to tables
df_red.to_sql('red_wine_table',con = engine,if_exists='replace')
df_white.to_sql('white_wine_table',con = engine,if_exists='replace')
```

![](resources/NEW_postgres_local_proof.png)


### Database: Merge Tables

The tables were merged using a SQL UNION query

```python
df_combined = pd.read_sql("SELECT * FROM red_wine_table UNION SELECT * FROM white_wine_table",con = engine)
df_combined.drop('index',axis=1,inplace=True)
```

![](resources/combined_df_via_python.png)

## Data Exploration: Combined Dataframe

### Volume
Using the combined dataframe, more data exploration was performed.

![](resources/bar_volume_type.png)

**Note**: There are a lot more white wine samples than red wine samples

![](resources/bar_volume_class.png)

**Observations**: There are more "good" wines than "bad"

### Outliers

![](resources/boxplot1.png)

![](resources/boxplot2.png)

![](resources/boxplot3.png)

**Observations**: There are a considerable number of outliers within most features. This raises some concern regarding how accurate a machine learning model will be in predicting outcomes.

### Scatter: Linear Relationships

![](resources/scatter.png)

**Observations**: 
- From a high-level perspective, there do not appear to be significant linear relationships between data points.
- Total sulfur and sulfur have a slight linear relationship as the data skews right

### Heatmap

![](resources/heatmap.png)

**Observations**:
- From the above chart we can see that free sulfur dioxide, total sulfer dioxide, and type have the highest values 
- From the chart we can also see that the alcohol, density and volatile acidity have the lowest values

## Model

For this project we will use Ensemble Learners to predict the wine classification, as well as determining feature importance to assess which feature is more responsible for determining quality.

## Machine Learning

### Pre-Processing: Dummy Variables

Column values for "type" and "class" were converted to 0's and 1's

![](resources/dummy.png)

        
### Split into Training and Testing

First, features and a target were defined:

```python
# Define features set
X = df_combined.copy().drop(['class', 'quality'],axis=1)

# Define target vector
y = df_combined["class"]
```
Next, data was split into testing and training subsets with an 80/20 split

```python
# Trained on 80 and tested on 20
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size=0.2, random_state=1)

#Standardize independent variables in ALL data (zero mean and unit variance)
std_X_train = StandardScaler().fit_transform(train_X)
std_X_test = StandardScaler().fit_transform(test_X)

std_train_df = pd.DataFrame(std_X_train, columns=train_X.columns)
std_test_df = pd.DataFrame(std_X_test, columns=test_X.columns)
```

![](resources/testtrainsplit.png)

        
### Logistic Regression
![](resources/logReg.png)

**Accuracy score**: .7311
  
### Random Forest

![](resources/rndforest.png)

**Feature Importance - Most**: The features of the most importance are 
- Alcohol (0.17)
- Volatile Acidity (0.11)
- Density (.11)

**Feature Importance - Least**: The features of the least importance are:
- pH (0.07)
- Fixed Acidity (.63)
- Wine Type (.004)

### Linear Regression

Using the features 'alcohol' and 'density', outlined above as 2 of the 3 more important features, linear regression was performed:

![](resources/linReg1.png)

![](resources/linReg2.png)

```
Model Coefficient: [-273.15060092]
Model Intercept: 282.1937840924431
```


## The Presentation / Dashboard

[Dashboard](https://public.tableau.com/views/wine_quality_16531982408620/Story1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

[Google Slides: Machine Learning, with Wine](https://docs.google.com/presentation/d/e/2PACX-1vTqoan2hVpKwoYIjAuQ4W-HpfsUVRlLGqymMuUIjRB6PQTaazfvCgaU0s7ISnSQ8RkUpHCy7jH6RrF8/pub?start=false&loop=false&delayms=50000)

# Conclusion

## **Question 1**:
Is a "Good" wine able to be predicted via the analysis of a wine's physicochemical properties? 

- Moderately so, an algorithm can predict a good wine.
  - Logistic Regression was able to output an accuracy score of 71%
  - Random Forest scored an F1 of 69%
    - Recall: 69%
    - Precision: 72%

## **Question 2**:
What physicochemical features are most responsible for determining wine quality?

- Based on Random Forest feature importance rankings, the following three provided the most value:
  - Alcohol (0.17)
  - Volatile Acidity (0.11)
  - Density (.11)

## **Question 3**: 
Can a 'good' wine be predicted using a chemical analysis agnostic of wine type (red or white)?

- Yes - interestingly, wine type was the least important feature by a large amount.