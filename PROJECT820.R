## preliminary analysis for CIND 820

getwd()

install.packages('tidyverse')
install.packages('dplyr')
library(dplyr)
library(tidyr)

##independent variables
cancer_incidence<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/13100109-eng/13100109.csv", sep = ",")
cancer<- read.csv(file="C:/Users/olivi/OneDrive/Documents/DataSets/13100109-eng/13100109_MetaData.csv", sep = ",")

###okay lets try cleaning some of this up
#make data frames

##Cancer incidence
#first remove columns from cancer incidence frame
##############################################################
cancer_table<- subset(cancer_incidence, select = -c(DGUID,UOM_ID,SCALAR_FACTOR,SCALAR_ID, VECTOR, COORDINATE, STATUS, SYMBOL, TERMINATED, DECIMALS))

#now remove all rows that contain the characteristic value containing "statistically different"

cancer_cl<-cancer_table[-grep("Statistically different from", cancer_table$Characteristics),]
cancer_cl<- cancer_cl[grep("age-standardized", cancer_cl$Characteristics),]
cancer_cl<-cancer_cl[-grep("95%", cancer_cl$Characteristics),]
cancer_cl<-cancer_cl[grep("Both", cancer_cl$Sex),]
cancer_cl<-cancer_cl[grep("All invasive", cancer_cl$Selected.sites.of.cancer..ICD.O.3.),]

cancer_w4<-subset(cancer_w4, select = -c(UOM))
#try spread
#remove duplicated elements so spread works
cancer_w<-cancer_cl[!duplicated(cancer_cl$VALUE),]
cancer_w4<-spread(cancer_w, Characteristics, VALUE)
cancer_w4<- cancer_w4[-grep("Canada", cancer_w4$GEO),]



##count number of region in occupation and cancer

n_distinct(cancer_cl$GEO)
##154


#####################################################################



##Feature Selection

#preliminary analysis
######################################################################################
#look at new cancer cases by geographic region
summary(cancer_w4)

hist(cancer_w4$`Cancer incidence (age-standardized rate per 100,000 population)`)
#normal distribution

hist(cancer_w4$`Cancer incidence (age-standardized rate per 100,000 population)`, xlab = "Cancer Incidence", main = "Canada Distribution", col = "red", breaks=50)

hist(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "Ontario Distribution", col ="blue", breaks = 25)
hist(cancer_BC$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "British Columbia Distribution", col ="blue", breaks = 25)
hist(cancer_QC$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "Quebec Distribution", col ="blue", breaks = 25)
hist(cancer_midwest$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "Midwest Distribution", col ="blue", breaks = 25)
hist(cancer_maritimes$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "Maritimes Distribution", col ="blue", breaks = 25)
hist(cancer_territories$`Cancer incidence (age-standardized rate per 100,000 population)`,xlab = "Cancer Incidence",main = "Territories Distribution", col ="blue", breaks = 15)


######################################################################################



##minimizing the location sample space

cancer_ON<- cancer_w4[grep("Ontario", cancer_w4$GEO),]

cancer_QC<- cancer_w4[grep("Quebec", cancer_w4$GEO),]
cancer_BC<- cancer_w4[grep("British Columbia", cancer_w4$GEO),]

cancer_MB<- cancer_w4[grep("Manitoba", cancer_w4$GEO),]
cancer_SK<- cancer_w4[grep("Saskatchewan", cancer_w4$GEO),]
cancer_AB<- cancer_w4[grep("Alberta", cancer_w4$GEO),]
cancer_midwest<- rbind(cancer_MB,cancer_AB,cancer_SK)

cancer_NL<- cancer_w4[grep("Newfoundland", cancer_w4$GEO),]
cancer_NB<- cancer_w4[grep("New Brunswick", cancer_w4$GEO),]
cancer_NS<- cancer_w4[grep("Nova Scotia", cancer_w4$GEO),]
cancer_PEI<- cancer_w4[grep("Prince Edward Island",cancer_w4$GEO),]
cancer_maritimes<- rbind(cancer_NS,cancer_NB,cancer_NL,cancer_PEI)

cancer_YT<- cancer_w4[grep("Yukon", cancer_w4$GEO),]
cancer_NWT<-cancer_w4[grep("Northwest Territories", cancer_w4$GEO),]
cancer_NVT<-cancer_w4[grep("Nunavut", cancer_w4$GEO),]
cancer_territories<- rbind(cancer_NWT,cancer_YT,cancer_NVT)


############################################################################################
######
######
######checking chi squared correlation manually between GEO and cancer incidence

 
chisq.test(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_ON$GEO)$p.value
chisq.test(cancer_QC$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_QC$GEO)$p.value
chisq.test(cancer_BC$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_BC$GEO)$p.value
chisq.test(cancer_maritimes$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_maritimes$GEO)$p.value
chisq.test(cancer_midwest$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_midwest$GEO)$p.value
chisq.test(cancer_territories$`Cancer incidence (age-standardized rate per 100,000 population)`,cancer_territories$GEO)$p.value


install.packages("DescTools")
library(DescTools)
#age standardized
UncertCoef(cancer_ON$GEO, cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_QC$GEO, cancer_QC$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_BC$GEO, cancer_BC$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_midwest$GEO, cancer_midwest$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_maritimes$GEO, cancer_maritimes$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_territories$GEO, cancer_territories$`Cancer incidence (age-standardized rate per 100,000 population)`, conf.level = 0.95, direction = "column")

#not age standardized
UncertCoef(cancer_ON$GEO, cancer_ON$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_QC$GEO, cancer_QC$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction="column")
UncertCoef(cancer_BC$GEO, cancer_BC$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_midwest$GEO, cancer_midwest$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_maritimes$GEO, cancer_maritimes$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction = "column")
UncertCoef(cancer_territories$GEO, cancer_territories$`Cancer incidence (rate per 100,000 population)`, conf.level = 0.95, direction = "column")


##regression

model1_ON<- lm(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_ON$GEO, data=cancer_ON)
summary.aov(model1_ON)
plot(model1_ON)

model1_BC<- lm(cancer_BC$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_BC$GEO, data=cancer_BC)
summary.aov(model1_BC)
plot(model1_BC)

model1_QC<- lm(cancer_QC$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_QC$GEO, data=cancer_QC)
summary.aov(model1_QC)
plot(model1_QC)

model1_midwest<- lm(cancer_midwest$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_midwest$GEO, data=cancer_midwest)
summary.aov(model1_midwest)
plot(model1_midwest)

model1_maritimes<- lm(cancer_maritimes$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_maritimes$GEO, data=cancer_maritimes)
summary.aov(model1_maritimes)
plot(model1_maritimes)

model1_territories<- lm(cancer_territories$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_territories$GEO, data=cancer_territories)
summary.aov(model1_territories)
plot(model1_territories)




Gaus_ON<- glm(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_ON$GEO, data = cancer_ON, family = "gaussian")
pois_ON<- glm(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_ON$GEO, data = cancer_ON, family = "poisson")


#kruskal-Wallis rank sum test
kruskal.test(cancer_ON$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_ON$GEO)
kruskal.test(cancer_QC$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_QC$GEO)
kruskal.test(cancer_BC$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_BC$GEO)
kruskal.test(cancer_midwest$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_midwest$GEO)
kruskal.test(cancer_maritimes$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_maritimes$GEO)
kruskal.test(cancer_territories$`Cancer incidence (age-standardized rate per 100,000 population)`~cancer_territories$GEO)




##writing files for python and GitHub

write.csv(cancer_incidence, file = "cancer_1.csv", fileEncoding = "UTF-8")
write.csv(cancer_cl, file = "cancer_cl.csv", fileEncoding = "UTF-8")


write.csv(cancer_w4, file = "cancer_w4.csv", fileEncoding = "UTF-8")
write.csv(cancer_ON, file= "cancer_ON.csv", fileEncoding = "UTF-8")
write.csv(cancer_BC, file= "cancer_BC.csv", fileEncoding = "UTF-8")
write.csv(cancer_midwest, file= "cancer_midwest.csv", fileEncoding = "UTF-8")
write.csv(cancer_QC, file= "cancer_QC.csv", fileEncoding = "UTF-8")
write.csv(cancer_maritimes, file= "cancer_maritimes.csv", fileEncoding = "UTF-8")
write.csv(cancer_territories, file= "cancer_territories.csv", fileEncoding = "UTF-8")

write.csv(cancer_Tab, file = "cancer_tab.csv", fileEncoding = "UTF-8")
