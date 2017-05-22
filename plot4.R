library (sqldf)
library(datasets)

# read data
sourcefile <- "../household_power_consumption.txt"
DF <- read.csv.sql(sourcefile,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#dates
dates <- as.POSIXct(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")

# png file
png(file="plot4.png", width = 480, height = 480)

#plot par
par(mfcol = c(2,2))

# plot global active power
plot(dates,DF$Global_active_power, type="o", pch=".", xlab="", ylab="Global Active Power (kilowatts)")

# plot energy sub metering
plot(dates,DF$Sub_metering_1, type="o", pch=".", xlab="", ylab="Energy sub metering")
lines(dates,DF$Sub_metering_2, type="o", pch=".", col="red")
lines(dates,DF$Sub_metering_3, type="o", pch=".", col="blue")
legend("topright",pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# plot voltage
plot(dates,DF$Voltage, type="o", pch=".", xlab="datetime", ylab="Voltage")

# plot global reactive power
plot(dates,DF$Global_reactive_power, type="o", pch=".", xlab="datetime", ylab="Global_reactive_power")

#save file
dev.off()