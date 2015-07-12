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

# Print the three sub metering values
png("plot3.png", width=480, height=480)
plot(household_power_consumption$datetime,household_power_consumption$Sub_metering_1,pch = "",
     xlab= "", ylab="Energy sub metering")
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_1,col = 'black')
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_2,col = 'red')
lines(household_power_consumption$datetime,household_power_consumption$Sub_metering_3,col = 'blue')
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c('black','red','blue'), # gives the legend lines the correct color and width
       lty=c(1,1)) # gives the legend appropriate symbols (lines)
dev.off()