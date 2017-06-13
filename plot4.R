library(lubridate)

plot4 <- function() {
    png("plot4.png")
    power <- read.csv("household_power_consumption.txt", sep=";")
    power$Date <- dmy(power$Date)
    
    power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"), ]
    power$datetime <- ymd_hms(paste(power$Date, power$Time))
    
    par(mfcol=c(2,2))
    
    with(power, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
    with(power, lines(datetime, Global_active_power))
    
    with(power, plot(datetime, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering"))
    
    with(power, lines(datetime, Sub_metering_2, col="red"))
    
    with(power, lines(datetime, Sub_metering_3, col="blue"))
    
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
    
    with(power, plot(datetime, Voltage, type = "l"))
    with(power, plot(datetime, Global_reactive_power, type="l"))
    dev.off()
}