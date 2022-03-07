# CIND820
Capstone course project repository

**Predictive Analytics Project Outline**

The [chosen dataset](https://github.com/OROY97/CIND820-OR/blob/DataSets/README.md) contains information about the incidence of invasvive cancer sites across all regions of Canada. This dataset has repeated time intervals of two year periods from 2001/2003 until 2013/2015.

>[Data preparation](https://github.com/OROY97/CIND820-OR/blob/Data-Prep-and-Clean/README.md) was done in R. 

This took the data set from 293 722 observations of 17 variables to 22 594 observations of 6 variables. Further transformation of the data set decreased the number of observations to [5226 and increased the number of variables to 8.](https://github.com/OROY97/CIND820-OR/blob/main/cancer_2.2.csv)

>**[Preliminary Analysis](https://github.com/OROY97/CIND820-OR/blob/Preliminary/README.md)**

Some preliminary analysis conducted in R and some summary statistics with stratified data compiled with Pandas-profiling. 

>**[Time series transformation and analysis](https://github.com/OROY97/CIND820-OR/blob/Time-Series-Analysis/README.md)**

  Time series transformation and analysis was done in R with the stratified data. The frequency feature of the transformation was denoted by the number of distinct values in the GEO feature of the data. This was done as the data collected repeated for each location as opposed to yearly data collected on a monthly interval. This data's _interval_ is the length of the number of location records collected every year or so. 
  
  This fits with the notion that the _"Argument frequency indicates the sampling frequency of the time series"_ as each of these locations is a _sample_ withing the given time intervals.

  The initial analysis before choosing which models to try includes decomposition plots, plots of each type of cancer, tests for stationarity: ACF and PACF plots, ljung-Box test, Augmented Cicky-Fuller test, and KPSS test. All of these things had somewhat mixed results. the ACF and PACF did not indicate strictly non-stationary patterns but many showed significant lags. 

  In the decompostion plots when the trend is removed from the time series most of the residuals resembled a white noise process. Some of the residual plots showed a non constant variance. These mixed results lead me to try the ARIMA model as it has the ability to deal with non-stationary data in specific cases.

**NOTE** Stationarity in these sets of data may indicated that there is an equal liklihood of getting diagnosed with cancer in any location with that area/region.

>**[Models](https://github.com/OROY97/CIND820-OR/blob/Models/README.md)**

**NOTE** the forecast plots should be redone for a clearer comparison between forecast and test values

The data was split into test/train sets with the ts.split function in R. The models tested: 
>TSLM - time series linear regression model
  
  This model drew me as it allows one to look at sppecific interactions with exogenous variables. The results were not the most promising and this may have been due to the use of GEO as a feature in the regression model as well as the frequency in the time series being used in the model. I believe this could be optimized and should be reevaluated although there are many factors that may affect the ability of this models predictive capabilities for this data.

>ARIMA

  The ARIMA model heavily outperformed the TSLM model as can be seen in the forecast plots. This model can deal with the _seasonality_ of the data, where seasonality here is the repeated cycles of location measurements. These measurements can vary significantly from one region to the next causing repeated variation in the time series. This is shown best the the Quebec data, whereby one region has a larger value consitently ( potentially due to population/age differences in that region increasing the volume of diagnosis )
  
  The ability for each ARIMA model to be tailored to the seasonality of each dataset increased the accuracy of the forecast for each model. The ARIMA model outperformed the TSLM in every measure though notable some measures are scale dependent and should be used cautiously (or not at all) when comparing the TSLM and the ARIMA with one another. 



[RMD file](https://github.com/OROY97/CIND820-OR/blob/R-code/PROJECT820.rmd)

[knit HTML](https://github.com/OROY97/CIND820-OR/blob/R-code/PROJECT820.html)






