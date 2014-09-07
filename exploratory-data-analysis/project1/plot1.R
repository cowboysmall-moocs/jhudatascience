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
# 2 - load the file and filter it as you read it:
# 
#   fread("sed -n -e 1p -e 66638,69517p ./data/household_power_consumption.txt", header = TRUE, sep = ";");
# 
# Note: the pre-processed file is included for convenience.

if (!require('data.table')) {

    install.packages('data.table');
    require('data.table');
}

data <- fread("sed -n -e 1p -e 66638,69517p ./data/household_power_consumption.txt", header = TRUE, sep = ";");

png(file = "plot1.png", width = 480, height = 480);

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

dev.off();
