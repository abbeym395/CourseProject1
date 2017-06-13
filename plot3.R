library(lubridate)

plot3 <- function() {
    png("plot3.png")
    power <- read.csv("household_power_consumption.txt", sep=";")
    power$Date <- dmy(power$Date)
    
    power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"), ]
    power$datetime <- ymd_hms(paste(power$Date, power$Time))
    
    with(power, plot(datetime, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering"))
    
    with(power, lines(datetime, Sub_metering_2, col="red"))
    
    with(power, lines(datetime, Sub_metering_3, col="blue"))
    
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
    dev.off()
}