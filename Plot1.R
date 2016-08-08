#----------------->>>>>>>>>>>>>>>>>>>--------------------------
# Simple Plot in R for Histogram Plotting 
# Exploratory Data Anlaysis
# Exercise - 1 , Plot - 1  
#----------------->>>>>>>>>>>>>>>>>>>--------------------------



library(dplyr)
newFile <- read.table("course_4_proj_1.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)
newFile$DateTime <- paste(newFile$Date, newFile$Time)
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")

power <- filter(newFile, DateTime >= as.Date("2006-02-01 00:00:00"), DateTime < as.Date("2006-02-03 00:00:00"))
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(KiloWatts)",ylab="Frequency")

