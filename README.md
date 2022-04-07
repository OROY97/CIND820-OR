# Evaluation

## TSLM

When the models are forcasted over the test values the ARIMA model out performed the TSLM models in accuracy
The TSLM models were faster to train, as they are less computationally intense.

The [forecast plots](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=%60%60%60-,Part%208%3A%20TSLM%20forecasting,%60%60%60,-Part%209%3A%20ARIMA) for TSLM 

## ARIMA
 The forecast plots for [ON](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_ON.4%3C%2Dforecast(arima_ON,test%20%3D%20test.ON%5B%2C6%5D)), [QC](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_QC.4%3C%2Dforecast(arima_QC,test%20%3D%20test.QC%5B%2C6%5D)), [BC](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_BC.4%3C%2Dforecast(arima_BC,test%20%3D%20test.BC%5B%2C6%5D)), [Midwest](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_mid.4%3C%2Dforecast(arima_mid,test%20%3D%20test.mid%5B%2C6%5D)), [Maritimes](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_mar.4%3C%2Dforecast(arima_mar,test%20%3D%20test.mar%5B%2C6%5D)), [Territories](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=fcast_terr.4%3C%2Dforecast(arima_terr,test%20%3D%20test.terr%5B%2C6%5D))


# Effectiveness

The accuracy Measures decisively say that the ARIMA model is more effective at predicting the test values, and that the specific cancer sites are usually easier to predict compared to the time series including all invasive cancer sites. The Models are compared mainly using MAPE and MASE measures for accuracy but the RMSE is used to evaluate the train vs test set measures for accuracy as an indicator for overfitting.

[accuracy measures](https://github.com/OROY97/CIND820-OR/blob/eb29e0148dde8017ff6bae8f3b364c230caea3cf/PROJECT820.rmd#L1550-#1666)

# Efficiency
The ARIMA models take more time to train when the order numbers increase in magnitude, they get more computationally expensive. The train times were [measured](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=tic(),toc()) using the tic() and toc() functions from the tictoc() library.

ARIMA Model |	Train Time Elapsed (seconds) |	TSLM Model |	Train Time Elapsed (seconds)
---|---|---|---
arima_ON.m |	155.7 |	tsr_ON	| 0.02
arima_ON.5.m	| 271.01 |	tsr_ON.5 |	0.0
arima_ON.6.m	| 102.52 |	tsr_ON.6 |	0.01
arima_QC.m |	3.08	| tsr_QC |	0.0
arima_QC.5.m	| 121.18 |	tsr_QC.5 |	0.01
arima_QC.6.m |	92.55	| tsr_QC.6 |	0.0
arima_BC.m	| 301.65 |	tsr_BC	| 0.02
arima_BC.5.m	| 73.2 |	tsr_BC.5 |	0.02
arima_BC.6.m |	41.0	| tsr_BC.6 |	0.0
arima_mid.m	 | 922.19 |	tsr_mid |	0.02
arima_mid.5.m	| 30.97	| tsr_mid.5	| 0.02
arima_mid.6.m	| 22.38 |	tsr_mid.6	| 0.01
arima_mar.m	| 28.71 |	tsr_mar |	0.02
arima_mar.5.m	 | 12.67 |	tsr_mar.5 |	0.02
arima_mar.6.m	| 782.44 |	tsr_mar.6	| 0.0
arima_terr.m	| 0.01 |	tsr_terr	| 0.02
arima_terr.5.m |	0.01 |	tsr_terr.5	| 0.0
arima_terr.6.m	| 0.03 |	tsr_terr.6 |	0.01


# Stability

As the ARIMA model was the most successful and there are 18 models the TSLM was not further evaluated. The ARIMA models may be subject to some overfitting making it likely that they will not be able to predict so much farther into the future while maintain their accuracy, as is the way of many predictive models. A larger window of time may unveild more consistent patterns but smoothing technique may also be used to determine a less "wiggly" trend.

The unit root tests for the order values of the ARIMA models show that many of the [inverse unit roots](https://github.com/OROY97/CIND820-OR/blob/main/PROJECT820.rmd#:~:text=Part%2012%3A%20Stability,arima_terr.6.m) follow closely along the unit circle. This also indicates an overfit type scenario. Making the models more accurate for the variation across locations but less robust over time. Few models displayed any inverse roots outside of the unit circle: only ON all invasive cancer sites, and colon cancer sites as well as Midwest' all invasive cancer sites.

