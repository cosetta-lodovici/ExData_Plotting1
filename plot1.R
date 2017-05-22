library (sqldf)

# read data
sourcefile <- "../household_power_consumption.txt"
DF <- read.csv.sql(sourcefile,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# png file
png(file="plot1.png", width = 480, height = 480)

hist(DF$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

#save file
dev.off()