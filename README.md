# Time Series Transformation and Analysis

Each dataset was turned into a [time series](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L174-L194), initially the lack of frequency factor lead to time sereies matrices with only 15 observations. After adding the frequency equal to the number of distinct values in the geography column, solved the issue and maintained the integrity of the data. This can be seen in the identical transformation of char strings in the GEO column to the correct number of corresponding integers.

The resulting plots displayed all the features on the same axis so the [decomposition plots](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L174-L194) were done with three of the 5 features of cancer incidence per regions. 
>NOTE: that not all residual plots are white noise

Each [time-series is plotted](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L233-L260) ordered by typer of cancer in order to compare the potential trends in these incidence rates between the different regions.

##[ACF and PACF Plots](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L266-L320)

All of the time-series show significant lags

##Tests for Stationarity

[Ljung-Box test](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L324-L351): non stationary will be low p-value

[Augmented Dickey-Fuller](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L358-L385): non stationary has a large p-value

[KPSS](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L389-L417): low p-value indicates non-stationarity
>differs with level/trend stationarity tests


