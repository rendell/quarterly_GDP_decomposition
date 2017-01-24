#Disaggregation yearly GDP data using quarterly data (tourism receipts)

#Temporal Disaggregation of Time Series using the d Chow-Lin procedure

# For methodological reference read Sax and Steiner (2013): http://journal.r-project.org/archive/2013-2/sax-steiner.pdf


# Install needed package
install.packages("tempdisagg")
library(tempdisagg)

# read files in R
yearly_GDP=read.csv("yearly_GDP.csv")
quarterly_dis=read.csv("quarterly_distribution.csv")

# Convert to a time series object
Nominal_GDP <- ts(yearly_GDP$Nominal.GDP, start=c(2007, 1), end=c(2016, 1), frequency=1) 
summary(Nominal_GDP)
str(Nominal_GDP)

Real_GDP <- ts(yearly_GDPR$Real.GDP, start=c(2007, 1), end=c(2017, 1), frequency=1) 
summary(Real_GDP)
str(Real_GDP)

receipts <- ts(quarterly_dis$Tour_receipts, start=c(2007, 1), end=c(2016, 4), frequency=4) 
summary(myq)
str(myq)

# plot series
plot(Nominal_GDP)
plot(Real_GDP)
plot(receipts)

m1 <- td(Nominal_GDP ~ receipts)
m1R <- td(Real_GDP ~ receipts)

# Forecast series
prediction=predict(m1)
predictionR = predict(m1R)
plot(prediction)
plot(predictionR)

write.csv(prediction, file="output_Nominal_GDP.csv")
write.csv(predictionR, file="output_Real_GDP.csv")

