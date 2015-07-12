# If not installed, the folowing line will install lubridate
# install.packages("lubridate")
library("lubridate")

# Load the dataset from the Downloads folder on a Unix system.
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")

# Filter the dataset
household_power_consumption$Date  <- dmy(household_power_consumption$Date)
start  <- ymd('2007-02-01')
end    <- ymd('2007-02-02')
filter <- (household_power_consumption$Date >= start & household_power_consumption$Date <= end)
household_power_consumption <- household_power_consumption[filter,]

# Convert the Time and concat date and time to datetime
household_power_consumption$Time  <- hms(household_power_consumption$Time)
household_power_consumption$datetime <- household_power_consumption$Date + household_power_consumption$Time


png("plot4.png", width=480, height=480)

# Set up 2x2 Matrix.
par(mfrow=c(2,2))

# Plot1
plot(x= household_power_consumption$datetime, y=household_power_consumption$Global_active_power ,xlab = "" ,pch = "",xaxt="n", ylab = "Global Active Power")
axis.POSIXct(1, at=seq(min(household_power_consumption$datetime), max(household_power_consumption$datetime), by="day"), format="%a")
lines(household_power_consumption$datetime,household_power_consumption$Global_active_power)

# Plot2
plot(household_power_consumption$datetime,household_power_consumption$Voltage,xlab = "datetime",ylab = 'Voltage',pch = "")
lines(household_power_consumption$datetime,household_power_consumption$Voltage)

# Plot3
plot(household_power_consumption$datetime,household_power_consumption$Sub_metering_1,pch = "", xlab= "", ylab="Energy sub metering")
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_1,col = 'black')
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_2,col = 'red')
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_3,col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lwd = 0, lty=c(1,1),col=c('black','red','blue')) 

# Plot4
plot(household_power_consumption$datetime,household_power_consumption$Global_reactive_power,xlab = "datetime",ylab = 'Global_reactive_power',pch = "")
lines(household_power_consumption$datetime,household_power_consumption$Global_reactive_power)

dev.off()