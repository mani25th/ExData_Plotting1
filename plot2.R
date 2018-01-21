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


## Plot 2
plot(dataSet$Datetime,dataSet$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

