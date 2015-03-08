
### loading library######
library("data.table")
#### reading data ########
data <- fread('household_power_consumption.txt', header=T, sep=';')
head(data)

## subsetting for Feb 1 and Feb 2nd
feb_data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
head(feb_data)

### ploting the graph
png(filename='plot1.png', width=480, height=480)
hist(as.numeric(feb_data$Global_active_power), xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red')
dev.off()
