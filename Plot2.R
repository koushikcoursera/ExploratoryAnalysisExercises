#----------------->>>>>>>>>>>>>>>>>>>--------------------------
# Plot in R for line chart using power consumption data 
# Exploratory Data Anlaysis
# Exercise - 1 , Plot - 2
# New functions used : as.posixct,dev.copy,transform
#----------------->>>>>>>>>>>>>>>>>>>--------------------------




power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

## Conversion of variables into numeric values
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)