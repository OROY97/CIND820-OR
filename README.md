# CIND820
Capstone course project repository

classification and regression analysis & predictive analytics project 

## Preliminary analysis for CIND 820

Removed columns from cancer incidence dataset that did not contain information 

cancer_table<- subset(cancer_incidence, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))

293722 observations while the dataset is formatted this way

67782 observations after some cleaning 
> cancer_cl.csv

Characteristics columns was brought to three values of interest

1. Cancer incidence (age-standardized rate per 100,000 population)
2. Cancer incidence (rate per 100,00 population)
3. Number of new cancer cases

Spread table so that these characteristics and their values belong in their own column
>insert link or file here


##count number of region in occupation and cancer
n_distinct(cancer_cl$GEO)
#154

To reduce cardinality of the geographic locations they are divided into groups based on their province
since we are looking at the relationship between cancer incidence and geographic location national 'peer groups' are also removed from the GEO column
>cancer_ON
>cancer_QC
>cancer_AB
>cancer_BC
>cancer_MB
>cancer_maritimes
>cancer_SK
>cancer_territories

EDA for each file:
uses pandas_profiling
