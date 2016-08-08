
#----------------->>>>>>>>>>>>>>>>>>>--------------------------
# Multiple  charts in r with legends and coloring 
# Exploratory Data Anlaysis
# Exercise - 1 , Plot - 4 
# new function used : as.posixct,transform,legend,linesdev.copy
#----------------->>>>>>>>>>>>>>>>>>>--------------------------

power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]


## Conversion of variables into numeric values
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

##first Plot
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##Second Plot
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Third Plot
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#Fourth Plot
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

