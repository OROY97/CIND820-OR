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
For preliminary analysis only the age-standardized rate of incidence is used as this is to help adjust for locations that have older age groups. Although it is important to note that regions with older age groups would be expected to have a higher rate of incidence even with the age standardized rate.
>cancer_w4

[RMD file](https://github.com/OROY97/CIND820-OR/blob/R-code/PROJECT820.rmd)


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
uses Python pandas_profiling 

[EDA- Not Stratified](https://github.com/OROY97/CIND820-OR/blob/main/output_w4.html)

[EDA-ON](https://github.com/OROY97/CIND820-OR/blob/main/output_ON%20(1).html)

[EDA-QC](https://github.com/OROY97/CIND820-OR/blob/main/output_QC%20(1).html)

[EDA-BC](https://github.com/OROY97/CIND820-OR/blob/main/output_BC%20(1).html)

[EDA-midwest](https://github.com/OROY97/CIND820-OR/blob/main/output_midwest%20(1).html)

[EDA-maritimes](https://github.com/OROY97/CIND820-OR/blob/main/output_maritimes%20(1).html)

[EDA-territories](https://github.com/OROY97/CIND820-OR/blob/main/output_territories%20(1).html)

