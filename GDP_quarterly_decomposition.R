#Disaggregation yearly GDP data using quarterly data (tourism receipts)
#Temporal Disaggregation of Time Series using the d Chow-Lin procedure
# For methodological reference read Sax and Steiner (2013): http://journal.r-project.org/archive/2013-2/sax-steiner.pdf
# Install needed package
install.packages("tempdisagg")
library(tempdisagg)
# read files in R
yearly_GDP=read.csv("yearlyGDP.csv")
quarterly_dis=read.csv("quarterly_distribution.csv")
# Convert to a time series object
Nominal_GDP <- ts(yearly_GDP$Nominal.GDP, start=c(2007, 1), end=c(2017, 1), frequency=1) 
summary(Nominal_GDP)
str(Nominal_GDP)
Real_GDP <- ts(yearly_GDP$Real.GDP, start=c(2007, 1), end=c(2017, 1), frequency=1) 
summary(Real_GDP)
str(Real_GDP)
receipts <- ts(quarterly_dis$Tour_receipts, start=c(2007, 1), end=c(2017, 4), frequency=4) 
summary(receipts)
str(receipts)
non_oil_imports <- ts(quarterly_dis$Non_oil_imports, start=c(2007, 1), end=c(2017, 4), frequency=4) 
summary(non_oil_imports)
str(non_oil_imports)

# plot series
plot(Nominal_GDP)
plot(Real_GDP)
plot(receipts)
plot(non_oil_imports)
distribution_Nominal <- td(Nominal_GDP ~ receipts + non_oil_imports)
distribution_Real <- td(Real_GDP ~ receipts + non_oil_import)
# Forecast series
prediction_N=predict(distribution_Nominal)
prediction_R = predict(distribution_Real)
plot(prediction_N)
plot(prediction_R)
write.csv(prediction_N, file="output_Nominal_GDP.csv")
write.csv(prediction_R, file="output_Real_GDP.csv")
