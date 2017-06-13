library(lubridate)

plot2 <- function() {
    power <- read.csv("household_power_consumption.txt", sep=";")
    power$Date <- dmy(power$Date)
    
    power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"), ]
    power$datetime <- ymd_hms(paste(power$Date, power$Time))
    
    with(power, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
    with(power, lines(datetime, Global_active_power))
}