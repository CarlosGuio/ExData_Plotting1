# Code for Plot 3
# To reproduce the plot, first download the file in your working directory

householdEPC <- read.table("household_power_consumption.txt", sep=";",
                           header=TRUE, na.strings = "?", nrows = 70000)        ## Read the file
householdEPC$Date <- as.Date(householdEPC$Date, format = "%d/%m/%Y")            ## Coerce the data in the "Date" column to "Date" class
householdEPC$Date_Time <- paste(householdEPC$Date, householdEPC$Time, sep = " ")## Create a new column by merging "Date" and "Time"
householdEPC$Date_Time <- strptime(householdEPC$Date_Time, "%Y-%m-%d %H:%M:%S") ## Coerce the data in "Date_Time" to POSIXlt
Date1 <- as.Date("2007-02-01")  
Date2 <- as.Date("2007-02-02")
data <- householdEPC[householdEPC$Date >= Date1  & householdEPC$Date <= Date2, ]## Subset the data corresponding to the dates 2007-02-01 and 2007-02-02 
png (filename="plot3.png", height=480, width=480)                               ## Open png device and set file name and dimensions
with(data, plot(Date_Time, Sub_metering_1, type="l",col="black", ylab="Energy 
                sub metering", xlab=""))
with(data, points(Date_Time, Sub_metering_2, type="l", col="red"))
with(data, points(Date_Time, Sub_metering_3, type="l", col="blue"))
legend("topright", pch="_", col =c("black","red","blue"), 
       legend =c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()                                                                       ## Close device
