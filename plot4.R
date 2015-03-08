setwd("/Users/shearora/Desktop/ExData_Plotting1")

# Load libraries
library(data.table)

# Load the data
data <- fread('household_power_consumption.txt', header=T, sep=';')

# Subset only Feb 1 and 2
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#### converting the time and date
feb$DateTime <- as.POSIXct(strptime(paste(feb$Date,feb$Time), "%d/%m/%Y %H:%M:%S"))

### plotting the graph
png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
### plot 1

plot(feb$DateTime,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#plot 2
plot(feb$DateTime, feb$Voltage,type="l",xlab="datetime",ylab="Voltage")


#plot 3 
plot(x=feb$DateTime,y=feb$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Meetering")
lines(x=feb$DateTime,y=feb$Sub_metering_2, type="l",col="red")
lines(x=feb$DateTime,y=feb$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

#plot 4
plot(feb$DateTime,feb$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

