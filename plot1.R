plot1 <- function() {
    png("plot1.png")
    power <- read.csv("household_power_consumption.txt", sep=";")
    power$Date <- as.Date(power$Date, "%d/%m/%Y")
    power$Time <- strptime(power$Time, "%H:%M:%S")
    
    power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"), ]
    
    hist(as.numeric(power$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=15, xlim=c(0,4000), ylim=c(0,1200))
    dev.off()
}
