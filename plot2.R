
# Load libraries
library(data.table)

# Load the data
data <- fread('household_power_consumption.txt', header=T, sep=';')

# Subset only Feb 1 and 2
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert Date and Time
head(feb)
feb$DateTime <- as.POSIXct(strptime(paste(feb$Date,feb$Time), "%d/%m/%Y %H:%M:%S"))
class(feb$DateTime)

### plotting the graph
png(filename="plot2.png",width=480,height=480,units="px")
plot(feb$DateTime,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
