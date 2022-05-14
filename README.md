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

Steps Taked for ML Mockup

1. Read in CSV
2. Data Cleaning    
    * Compile Null Lists
    * Missing Data Check
    * Create DF with lists
    * Set Index
    * Quality Score Distribution
    * Fill Blanks with 0
    * Visualization of Distribution of Wine Quality Scores by Type
    * Set Classification Column (If wine is greater 7 its "good")
    * Combine Dataframes
3. Data Exploration 
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
    * Over & Sampling
    * Random Forrest
    * Logistic Regression
    
   
## The Question(s)

This project will aim to determine the following:
1. Is a "Good" wine able to be predicted via the analysis of a wine's physicochemical properties? 
2. What physicochemical features are most responsible for determining wine quality?
3. Can a wine quality evaluation be conducted agnostic of wine type (red or white), or do such evaluations need to remain segregated by type?

## The Dashboard

https://docs.google.com/presentation/d/1S7EIV4yDhFQDB4CjyAN1KUtyvd31ClgRe1xQhX6uzLc/edit#slide=id.g11bf644337f_0_134

Storyboard on a Google Slide(s)
Description of the tool(s) that will be used to create the final dashboard
Description of interactive element(s)
