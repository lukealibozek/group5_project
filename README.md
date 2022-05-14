# Wine Quality Analysis

For this project we aim to assess wine quality, and whether it is possible to classify a wine based on its chemical properties.

## Sources

The data sources used for this analysis were pulled from UCI's machine learning repository, donated by Paulo Cortez of the University of Minho, Portugal (P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis).
- **Wine Quality Datasets** [(view)](http://www3.dsi.uminho.pt/pcortez/wine/)

The data relates to red and white Vinho Verde wine samples, and their physicochemical properties.

## EDA

<details>
    <summary>Click here to expand...</summary>

The dataset was originally in the form of two CSV's - one for red wine, one for white:

![](resources/df_example.png)

The data types were assessed, in addition to checking for Null/NA values.

![](resources/data_cleaning.png)

The distribution of wine quality was assessed by creating a new dataframe using normalized value counts (quality scores represented as percentages of total wine counts).

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

### Takeaways

- Distribution is relatively even across both wines, with most wines scoring 5's and 6's
- Red wine max quality score was 8, while White wine maxed at 9
- A "good" wine score higher than 7 will yield very few wines - therefore, "good" classification is best set at 7, for the purposes of this analysis. 

![](resources/good_threshold.png)
  
</details>
  
## Database
- Use QuickDB to draft up the database structure
- Use Postgres for the database

![](resources/QuickDBD-wine.png)


## Model

For this project we will use Ensemble Learners to predict the wine classification, as well as determining feature importance to assess which feature is more responsible for determining quality.

### Steps Taken for ML Mockup

1. Read in CSV and view data set
2. Data Cleaning    
Compile Null Lists
-There are no null values in the given data set
    * Missing Data Check
        -There is no missing data
    * Create DF with lists
    * Set Index
<img width="515" alt="image" src="https://user-images.githubusercontent.com/95591222/168451298-321e1ebe-1159-433a-8832-34c94e649305.png">

    * Quality Score Distribution
    * Fill Blanks with 0
<img width="81" alt="image" src="https://user-images.githubusercontent.com/95591222/168451310-3adc685c-5e4e-40d0-aa0e-6fbc40c9f861.png">

    * Visualization of Distribution of Wine Quality Scores by Type
<img width="191" alt="image" src="https://user-images.githubusercontent.com/95591222/168451336-dee4b34d-f5b9-4cbf-87b0-abfbd58511fe.png">
        - Red wine max quality score was 8, while White wine maxed at 9
  
    * Set Classification Column (If wine is greater 5 its "good")
<img width="188" alt="image" src="https://user-images.githubusercontent.com/95591222/168451362-fd45226a-aa10-40b5-88dd-4cd070f69660.png">
        - Distribution is relatively even across both wines, with most wines scoring 5's and 6's.However, when it is too balanced it ends up giving us the perfect model. The first classification was set at 7 and gave an accuracy of 100%. By moving the threshold to 5 we can get a more realiable model. 
     
    * Combine Dataframes
    
 <img width="501" alt="image" src="https://user-images.githubusercontent.com/95591222/168451540-08e03702-083a-485c-bf8b-a71cd83dead8.png">
        - The number of rows before merging was 1599 and the number of rows after merging was 6497. The columns remained at 14.

### Data Exploration Continued...
    * Quality
    * Counts
    * Averages 
    * Created Dummy Variable for Strings "Type" and "Class"
    * Outliers
    * Bar Graphs 
    * Boxplot
    * Scatter
    * Heatmap
4. Split into Training and Testing
    * Defined Features 
    * Partitioned Data
5. Models
    * Logistic Regression
    * Over & Sampling
    * Random Forrest
    * Linear Regression
    
   
## The Question(s)

This project will aim to determine the following:
1. Is a "Good" wine able to be predicted via the analysis of a wine's physicochemical properties? 
2. What physicochemical features are most responsible for determining wine quality?
3. Can a wine quality evaluation be conducted agnostic of wine type (red or white), or do such evaluations need to remain segregated by type?

## The Presentation / Dashboard

[Google Slides: Machine Learning, with Wine](https://docs.google.com/presentation/d/e/2PACX-1vTqoan2hVpKwoYIjAuQ4W-HpfsUVRlLGqymMuUIjRB6PQTaazfvCgaU0s7ISnSQ8RkUpHCy7jH6RrF8/pub?start=false&loop=false&delayms=50000)


