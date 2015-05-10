# Code for Plot 2
# To reproduce the plot, first download the file in your working directory

householdEPC <- read.table("household_power_consumption.txt", sep=";",
                           header=TRUE, na.strings = "?", nrows = 70000)        ## Read the file
householdEPC$Date <- as.Date(householdEPC$Date, format = "%d/%m/%Y")            ## Coerce the data in the "Date" column to "Date" class
householdEPC$Date_Time <- paste(householdEPC$Date, householdEPC$Time, sep = " ")## Create a new column by merging "Date" and "Time"
householdEPC$Date_Time <- strptime(householdEPC$Date_Time, "%Y-%m-%d %H:%M:%S") ## Coerce the data in "Date_Time" to POSIXlt
Date1 <- as.Date("2007-02-01")  
Date2 <- as.Date("2007-02-02")
data <- householdEPC[householdEPC$Date >= Date1  & householdEPC$Date <= Date2, ]## Subset the data corresponding to the dates 2007-02-01 and 2007-02-02 
png (filename="plot2.png", height=480, width=480)                               ## Open png device and set file name and dimensions
with(data, plot(Date_Time, Global_active_power, type="l", ylab="Global active 
                power kilowatts", xlab=""))                                     ## Plot
dev.off()                                                                       ## Close device
