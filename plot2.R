library (sqldf)

Sys.setlocale("LC_ALL", "English")

# read data
sourcefile <- "../household_power_consumption.txt"
DF <- read.csv.sql(sourcefile,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# png file
png(file="plot2.png", width = 480, height = 480)

plot(as.POSIXct(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S"),DF$Global_active_power, type="o", pch=".", xlab="", ylab="Global Active Power (kilowatts)")

#save file
dev.off()