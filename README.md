**Exploratory Data Analysis** 

For preliminary analysis, only the age-standardized rate of incidence is used as this is to help adjust for locations that have older age groups. Although it is important to note that regions with older age groups would be expected to have a higher rate of incidence even with the age standardized rate.

**EDA Output**_-pandas-profiling_

>[cancer_w4](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_w4.html)


##count number of region in occupation and cancer
n_distinct(cancer_cl$GEO)
#154

To reduce cardinality of the GEO feature, it is stratified.

EDA Output for each file:
uses Python pandas_profiling 

>[cancer_ON](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_ON%20(1).html)
>[cancer_QC](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_QC%20(1).html)
>[cancer_BC](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_BC%20(1).html)
>[cancer_Midwest](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_midwest%20(1).html)
>[cancer_Maritimes](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_maritimes%20(1).html)
>[cancer_Territories](https://github.com/OROY97/CIND820-OR/blob/Preliminary/output_territories%20(1).html)


