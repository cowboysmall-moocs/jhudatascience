
if (!require('reshape2')) {

    install.packages('reshape2');
    require('reshape2');
}

if (!require('ggplot2')) {

    install.packages('ggplot2');
    require('ggplot2');
}


NEI_Cities      <- subset(readRDS("./data/summarySCC_PM25.rds"), (fips == "24510" | fips == "06037") & type == "ON-ROAD")
NEI_Cities$City <- ifelse(NEI_Cities$fips == "24510", "Baltimore", "Los Angeles");


NEI_long <- melt(NEI_Cities, id.vars = c("year", "City"), measure.vars = "Emissions");
NEI_wide <- dcast(NEI_long, year + City ~ variable, sum);


png(file = "plot6.png", width = 640, height = 480);

p <- ggplot(NEI_wide, aes(year, Emissions, group = City));
p <- p + geom_line(aes(color = City));
p <- p + ggtitle("Total" ~ PM[2.5] ~ "Emissions By Motor Vehicle Sources (Baltimore City vs. Los Angeles County)");
p <- p + xlab("Years");
p <- p + ylab("Total" ~ PM[2.5] ~ "Emissions");

print(p);

dev.off();

# Alternative approach...
# 
# NEI_BC      <- subset(NEI, fips == "24510" & type == "ON-ROAD");
# NEI_BC$City <- "Baltimore";
# NEI_LA      <- subset(NEI, fips == "06037" & type == "ON-ROAD");
# NEI_LA$City <- "Los Angeles";
# NEI_Cities  <- rbind(NEI_BC, NEI_LA);
