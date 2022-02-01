# CIND820
Capstone course project repository

classification and regression analysis & predictive analytics project 

## preliminary analysis for CIND 820

getwd()

install.packages('dplyr')
library(dplyr)

##independent variables
cancer_incidence<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/13100109-eng/13100109.csv", sep = ",")
cancer<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/13100109-eng/13100109_MetaData.csv", sep = ",")

##dependent variables to look at

#labour force statistics
labour_force<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/14100025-eng/14100025.csv", sep = ",")
labour_MD<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/14100025-eng/14100025_MetaData.csv", sep = ",")

#income and tax statistics
##by province
inc_tax<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/tbl5.csv", sep = "," )

tax_file<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/11100008-eng/11100008.csv", sep = ",")


##Leisure time level of physical activity
leisure<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/13100490-eng/13100490.csv",sep = ",")
leisure_MD<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/13100490-eng/13100490_MetaData.csv",sep = ",")

##occupation
##more specific geography
occupation<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/11100147-eng/11100147.csv", sep = ",")
occupation_MD<- read.csv(file = "C:/Users/olivi/OneDrive/Documents/DataSets/11100147-eng/11100147_MetaData.csv", sep = ",")



###okay lets try cleaning some of this up
#make data frames

##Cancer incidence
#first remove columns from cancer incidence frame

cancer_table<- subset(cancer_incidence, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))

#now remove all rows that contain the characteristic value containing "statistically different"

cancer_cl<-cancer_table[-grep("Statistically different from", cancer_table$Characteristics),]
cancer_cl<-cancer_cl[-grep("95%", cancer_cl$Characteristics),]
cancer_w2<-subset(cancer_w2, select = -c(UOM))

#remove duplicated elements so spread works
cancer_w<-cancer_cl[!duplicated(cancer_cl$VALUE),]
##spread columns to see better [working df]
cancer_w2<- spread(cancer_w, Characteristics, VALUE)


##count number of region in occupation and cancer
n_distinct(cancer_cl$GEO)
#154

n_distinct(occupation$GEO)
#35

##continue cleaning other data sets
#remove columns
#count NA

occupation_table<- subset(occupation, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))
#change reference years
occupation_cl<- occupation_table[occupation_table$ï..REF_DATE>2000,]
occupation_w<- spread(occupation_cl, Statistics, VALUE)
occupation_w<- occupation_w[-grep("Elementary school", occupation_w$Selected.characteristics),]

leisure_table<-subset(leisure, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))
#change reference years
leisure_cl<- leisure_table[leisure_table$ï..REF_DATE>2000,]
leisure_cl<- leisure_cl[-grep("95%", leisure_cl$Characteristics),]

##activity levels
n_distinct(leisure_cl$Leisure.time.physical.activity)

##trying to reshape the data for characteristics column

leisure_w<- spread(leisure_cl, Characteristics, VALUE)

leisure_w2<- spread(leisure_cl, Leisure.time.physical.activity, VALUE)

##Clean up tax dataset
tax_table<-subset(tax_file, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))
tax_cl<- tax_table[tax_table$ï..REF_DATE<2016,]                       

tax_w<- spread(tax_cl, Persons.with.income, VALUE)
tax_w<- tax_w[-6]

tax_w<- tax_w[tax_w$UOM!="Percent",]

##Feature Selection

#preliminary analysis

#look at new cancer cases by geographic region
summary(cancer_w2)

barplot(cancer_w2$`Cancer incidence (age-standardized rate per 100,000 population)`, names.arg = cancer_w2$ï..REF_DATE )
barplot(cancer_w2$`Cancer incidence (age-standardized rate per 100,000 population)`, names.arg = cancer_w2$GEO)

barplot(cancer_w2$`Number of new cancer cases`, names.arg = cancer_w2$ï..REF_DATE)

hist(cancer_w2$`Cancer incidence (age-standardized rate per 100,000 population)`, na.rm=TRUE)
hist(cancer_w2$`Cancer incidence (rate per 100,000 population)`, na.rm=TRUE)
hist(cancer_w2$`Number of new cancer cases`, na.rm=TRUE)
