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


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

  plot(dataSet$Datetime,dataSet$Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")
  
  plot(dataSet$Datetime,dataSet$Voltage, type="l", 
       ylab="Voltage", xlab="")
  
  plot(dataSet$Datetime,dataSet$Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(dataSet$Datetime,dataSet$Sub_metering_2,col='Red')
  lines(dataSet$Datetime,dataSet$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dataSet$Datetime,dataSet$Global_reactive_power, type="l", 
       ylab="Global_rective_power",xlab="datetime")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

