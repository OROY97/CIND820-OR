# Modeling

First the each time-series dataset is [split into test set and train set](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L421-L445) with the equivilent number of 2 periods worth of observations. 

There are three models for each geographic group:
- All cancer sites
- Lung cancer sites
- Colon cancer sites

## TSLM

[Each model is trained on only the training data](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L450-L502) 

This is a linear regression model for a time series where the features of interest that are independant to the incidence of cancer are GEO and Sex. I believe this model is inherently flawed currently as the GEO varaible is already represented in the time series as the frequency. I plan to go back and see if differenced data and/or different coefficient features are selected.

**Forecast plotting**
>Note: these forecast plots do not meet standards of clarity with the test set values layered over

The [forecast plots](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L508-L672) show that these tslm models are not a great match with the test data. 

## ARIMA

First each model is run with the auto.arima function to get an idea of the magnitude of the AIC and AICc. I manually increased and decreased the _order_ c(p,d,q) values and the _seasonal_ c(P,D,Q) values in the Arima function based on the number of lags indicated in the ACF and PACF plots ranging from 1 to 7 stationarity tests ranging from 3 to 8. Using the auto.arima model as a starting point. 

I also kept in mind the magnitude of the D and Q values as they increased the most within models and the models with a higher Q,q or D values took significantly longer to train. Though the chosen models are based on the models with the lowest AIC/AICc, sometimes these values increased only marginally with each 1 unit increase of the _order_ or _seasonal_ values. 

>Also noting that larger data sets, example: Ontario vs Territories, models took more time to train.

-[ARIMA Ontario](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L677-L733)

-[ARIMA Quebec](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L752-L807)

-[ARIMA British Columbia](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L828-L890)

-[ARIMA Midwest](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L911-L976)

-[ARIMA Maritimes](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L996-L1060)

-[ARIMA Territories](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L1080-L1104)

The forecasting for this model is superior to the current tslm models. This is seen right away as the seasonal variation is very present in the forecast plot and that is more valuable than the very linear predictions from the tslm, which did not capture the variation felt withing the yearly interval. 

>Note: these forecast plots do not meet standards of clarity with the test set values layered over
>
-[Ontario forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L738-L748)

-[Quebec forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L812-L824)

-[BC forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L894-L906)

-[Midwest forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L980-L992)

-[Maritimes forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L1064-L1076)

-[Territories forecast](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L1108-L1121)

# Accuracy Tests

There are three sets of [accuracy functions](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L1152-L1253) for each model for each of the six geographic groups. The accuracy metrics all overwhelmingly show two things, the ARIMA was more accurate than the TSLM, and that within both types of models the more specific sites of cancer had more accurate forecasts than all sites of cancer.
