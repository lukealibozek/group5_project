# group5_project

## Roles, Communication

![](resources/role%20framework.png)

### Week 1
|Teamate          |Role    |Description      |Week 2 Role   |
|---              |---     |---              |---           |
|Luke Alibozek    |Square  |Repo Mgmt        |Circle        |
|David Warren Katz|Triangle|ML Mockup        |Triangle      |
|Justin Suh       |Circle  |DB Mockup        |X             |
|Lawrence Johnson |X       |Technology Czar  |Square        |

### Communication

- A Slack channel has been established between the team members. 
- Dedicated meeting times have not been established. 

## Dataset

#### COVID-19 Case Surveillance Public Use Data with Geography
- **Source**: 
  - Centers for Disease Control and Prevention [(view)](https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4)

#### County Population Totals: 2020-2021
- **Source**:
  - County Population Totals: 2020-2021 [(view)](https://www.census.gov/data/datasets/time-series/demo/popest/2020s-counties-total.html#par_textimage_70769902)
  - (Direct Link) Index of /programs-surveys/popest/datasets/2020-2021/counties/totals [(view)](https://www2.census.gov/programs-surveys/popest/datasets/2020-2021/counties/totals/)

## Purpose

- The COVID-19 dataset is massive in terms of quantity (69.7 million rows), but staggered in it's quality (many "missing" or "unknown" values when it comes to hospitalization, ICU admittance, etc). 
- Given that the COVID-19 data includes geography by county, US Census data (2020-2021) by county was also pulled to add additional context to the analysis.
- We can make an assumption that non-missing hospitalization and ICU cases are accurate data points likely provided by an institution (hospital). Moreso, the positive ICU cases may present an even greater opportunity to analyze comprehensive data points. 

Our goal is to predict resource utilization (possibly hospitalization or ICU admittance) in response to COVID-19, segmented by geography.

## Technology Use

- As a group we are still determining the question we are going to answer with our analysis. Once that is determined then the techonology czar will be able to expand more on the technology that will be used in the project.

## Technology Suggestions

- Based on the data we have so dar and with us breaking down CSV files, the python would be beneficial so we can import the files and break them down to the data that is needed to answer our questions. Using Python, we can create codes to eliminate data that is not useful and create a chart of the data only needed for our analysis. 

- Below is an example of from one of our previous modules where we had to import data from a csv file.
- file_path = "C:\\Users\Documents\GitHub\Cryptocurrencies\iris.csv"
iris_df = pd.read_csv(file_path)
iris_df.head()
- Based on the example above we would be able to import the data by uploading the file path to retrieve the data we are going to analyze.
