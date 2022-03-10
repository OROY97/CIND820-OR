# Data Preparation and Transformation

First there are many feature columns that are arbitrary as they denote the same meaning as the columns of interest but have less meaning. [These were removed](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L43) and [cleaned](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L47-L59) before a very [preliminary look](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L63-L70) at the data. 

>cancer_w4 is used for the [pandas profiling](https://github.com/OROY97/CIND820-OR/blob/R-code/output_w4.html) step of all Canada.

Based on the previous steps I [condensed](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L75-L90) the cleaning into a new dataset [cancer_2.2](https://github.com/OROY97/CIND820-OR/blob/main/cancer_2.2.csv)
>rows with observations not of interest are removed from the to aboid issues when the dataset is spread, twice, to increase clarity of the values of each type of cancer.

some historgrams are created in R for this data set:

<img src="https://user-images.githubusercontent.com/97854617/157109670-9b7e3ad6-343d-4198-9032-dca3b1d8b83b.png" width="350x400">  <img src="https://user-images.githubusercontent.com/97854617/157109632-9a63ddd8-ab4e-4ea1-9fc6-4a86c1bb2544.png" width="350x400">  <img src="https://user-images.githubusercontent.com/97854617/157109589-6970fbc1-05e6-46b7-8b5b-f16e9c245f63.png" width="350x400">  <img src="https://user-images.githubusercontent.com/97854617/157109429-5614d01f-94c7-4dff-9fd5-046f24583a36.png" width="350x400">  <img src="https://user-images.githubusercontent.com/97854617/157109545-628e26b7-c7c2-4b04-9a11-c00425c753d2.png" width="350x400">

[Quantiles for cancer incidence were created](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L107-L111) but have yet to be used.

Next the dataset was [stratified](https://github.com/OROY97/CIND820-OR/blob/1117ae88d1a14552956481c2849766c92624953f/PROJECT820.rmd#L150-L169) into different geographic regions from across Canada. Provincial borders were considered as there are provincial healthcare differences, but the local geography such as oceans, forest, plains, northern longitude etc also impact chosen geographic regions. Doing this also ensured an adequate amount of observations for analysis. This lead to six different datasets:
>[Ontario](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_ON.csv)
>[Quebec](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_QC.csv)
>[British Columbia](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_BC.csv)
>[Midwest](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_midwest.csv)
>[Maritimes](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_maritimes.csv)
>[Territories](https://github.com/OROY97/CIND820-OR/blob/R-code/cancer_territories.csv)



