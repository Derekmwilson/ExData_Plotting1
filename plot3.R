

## Exploratory Data Analysis: Course Project #1

#setwd("C:/Users/Del Boy/Documents/Coursera/Exploratory Data Analysis/Project1")
#getwd()


# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.



# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
# 16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000

a <- read.table("household_power_consumption.txt"
                ,header=TRUE
                ,sep=";"
                ##,colClasses = c("factor","factor",rep("numeric",7))
                ##,nrows=100
        )
# nrow(a)
# head(a$Date)
# class(a$Date)

b <- a[as.character(a$Date)=="1/2/2007"|as.character(a$Date)=="2/2/2007", ]
# nrow(b)
# head(b)
# class(b)

b$Global_active_power <- as.numeric(levels(b$Global_active_power))[b$Global_active_power]
b$Global_reactive_power <- as.numeric(levels(b$Global_reactive_power))[b$Global_reactive_power]
b$Voltage <- as.numeric(levels(b$Voltage))[b$Voltage]
b$Global_intensity <- as.numeric(levels(b$Global_intensity))[b$Global_intensity]
b$Sub_metering_1 <- as.numeric(levels(b$Sub_metering_1))[b$Sub_metering_1]
b$Sub_metering_2 <- as.numeric(levels(b$Sub_metering_2))[b$Sub_metering_2]
b$Sub_metering_3 <- as.numeric(levels(b$Sub_metering_3))[b$Sub_metering_3]

datetime <- strptime(paste(as.character(b$Date),as.character(b$Time), sep=" "), "%d/%m/%Y %H:%M:%S")
b <- cbind(b,datetime)
# head(b)

## Plot 3
plot(b$datetime,b$Sub_metering_1
     ,type = "l"
     ,main = ""
     ,xlab = ""
     ,ylab = "Energy sub metering"
     
)

points(b$datetime,b$Sub_metering_2
     ,type = "l"
     ,col = "red"
     
)

points(b$datetime,b$Sub_metering_3
       ,type = "l"
       ,col = "blue"
       
)

legend(
        "topright"
        ,pch = "-"
        , col = c("black","red","blue")
        , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        )


