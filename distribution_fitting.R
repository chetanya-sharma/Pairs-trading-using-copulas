rm(list=ls())

library(MASS)



#######################################
#Normal Distribution

data <- read.csv("carbouniv.csv",header=0)

data <- unlist(as.vector(data))

fit <- fitdistr(data,"normal")

mean_fit <- fit$estimate["mean"]
sd_fit <- fit$estimate["sd"]

hist(data, breaks=100, col="lightblue", 
     main="Histogram for the data", xlab="Data",
     ylab="Frequency")

x <- seq(min(data),max(data), length=100)
normal_curve <- dnorm(x,mean=mean_fit,sd=sd_fit)
normal_density <- dnorm(x,mean=mean_fit,sd=sd_fit)
scaled_density <- normal_density * length(data) * diff(hist(data,breaks=20)$breaks[1:2])
lines(x,scaled_density,col="red",lwd=2)


##################################################

#beta distribution

rm(list=ls())
library(MASS)


data <- read.csv("carbouniv.csv",header=0)
a <- min(data)
b <- max(data)
data_scaled <- (data-a)/(b-a)
epsilon <- 1e-8
data_scaled[data_scaled == 0] <- epsilon
data_scaled[data_scaled == 1] <- 1-epsilon
data <- unlist(as.vector(data))
data_scaled <- unlist(as.vector(data_scaled))

hist(data_scaled, main="Histogram of Scaled Data", breaks=30)

fit <- fitdist(data_scaled,"beta", start =list(shape1=2,shape2=2))
summary(fit)

hist(data_scaled,probability = TRUE, breaks=30, main="Histogram fitted with Beta Distribution",xlab="Scaled Data",col="lightblue")

x <- seq(0,1,length.out = 100)
fitted_density <- dbeta(x, shape1 = fit$estimate["shape1"], shape2 = fit$estimate["shape2"])
lines(x,fitted_density,col="red",lwd = 2)

#################################################

#log normal distribution

data <- read.csv("carbouniv.csv",header=0)
a <- min(data)
b <- max(data)
data_scaled <- (data-a)/(b-a)
epsilon <- 1e-8
data_scaled[data_scaled == 0] <- epsilon
data_scaled[data_scaled == 1] <- 1-epsilon
data_scaled <- unlist(as.vector(data_scaled))

hist(data_scaled, main="Histogram of Chi-Squared distribution", breaks=30)

fit <- fitdist(data_scaled, "lnorm")
x <- seq(min(data_scaled),max(data_scaled),length.out = 100)
fitted_density <- dlnorm(x, meanlog = fit$estimate["meanlog"], sdlog = fit$estimate["sdlog"])
lines(x, fitted_density, col="red", lwd=2)


########################################

#chi-squared distribution

fit_chsq <- fitdist(data_scaled, "chisq", start=list(df=5))
fitted_density <- dchisq(x,df=fit_chsq$estimate["df"])
lines(x,fitted_density,col="red",lwd=2)
