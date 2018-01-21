## Getting full dataset
hhpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 stringsAsFactors=F, comment.char="", quote='\"')
hhpc$Date <- as.Date(hhpc$Date, format="%d/%m/%Y")

## Filter the data 
dataSet <- hhpc[hhpc$Date >= "2007-02-01" & hhpc$Date <= "2007-02-02",]

rm(hhpc)

## Converting dates
dateTimeConvert <- paste(as.Date(dataSet$Date), dataSet$Time)
dataSet$Datetime <- strptime(dateTimeConvert, "%Y-%m-%d %H:%M:%S")



## Plot 3
plot(dataSet$Datetime,dataSet$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
  
  lines(dataSet$Datetime,dataSet$Sub_metering_2,col='Red')
  lines(dataSet$Datetime,dataSet$Sub_metering_3,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

