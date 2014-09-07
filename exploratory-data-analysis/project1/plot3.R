# There are a two options so that you don't load all of the file into memory
# 
# 1 - pre-process the data with something like the following command:
# 
#   sed -n -e 1p -e 66638,69517p ./data/household_power_consumption.txt > ./data/household_power_consumption_truncated.txt
# 
# and then load it as normal:
# 
#   data <- read.table("./data/household_power_consumption_truncated.txt", header = TRUE, sep = ";");
# 
# or:
# 
#   data <- fread("./data/household_power_consumption_truncated.txt", header = TRUE, sep = ";");
# 
# 2 - load the file and filter it s you read it:
# 
#   fread("sed -n -e 1p -e 66638,69517p ./data/household_power_consumption.txt", header = TRUE, sep = ";");
# 
# Note: the pre-processed file is included for convenience.

if (!require('data.table')) {

    install.packages('data.table');
    require('data.table');
}

data <- fread("sed -n -e 1p -e 66638,69517p ./data/household_power_consumption.txt", header = TRUE, sep = ";");

png(file = "plot3.png", width = 480, height = 480);

date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

legend_headings <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3");
legend_colours  <- c("black", "red", "blue");

plot(date, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l");
lines(date, data$Sub_metering_2, col = "red");
lines(date, data$Sub_metering_3, col = "blue");
legend("topright", legend_headings, lty = c(1, 1, 1), col = legend_colours);

dev.off();
