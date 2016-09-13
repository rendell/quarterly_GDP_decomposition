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
myear <- ts(yearly_GDP$Nominal.GDP, start=c(2007, 1), end=c(2016, 1), frequency=1) 
summary(myear)
str(myear)

myq <- ts(quarterly_dis$Tour_receipts, start=c(2007, 1), end=c(2016, 4), frequency=4) 
summary(myq)
str(myq)

# plot series
plot(myear)
plot(myq)
m1 <- td(myear ~ myq)

# Forecast series
prediction=predict(m1)
plot(prediction)

write.csv(prediction, file="output_GDP.csv")
