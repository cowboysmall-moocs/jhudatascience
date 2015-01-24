
if (!require('reshape2')) {

    install.packages('reshape2');
    require('reshape2');
}

if (!require('ggplot2')) {

    install.packages('ggplot2');
    require('ggplot2');
}


NEI_V_B <- subset(readRDS("./data/summarySCC_PM25.rds"), fips == "24510" & type == "ON-ROAD");


NEI_long <- melt(NEI_V_B, id.vars = "year", measure.vars = "Emissions");
NEI_wide <- dcast(NEI_long, year ~ variable, sum);


png(file = "plot5.png", width = 640, height = 480);

p <- ggplot(NEI_wide, aes(year, Emissions));
p <- p + geom_line(color = "red");
p <- p + ggtitle("Total" ~ PM[2.5] ~ "Emissions By Motor Vehicle Sources (Baltimore City)");
p <- p + xlab("Years");
p <- p + ylab("Total" ~ PM[2.5] ~ "Emissions");

print(p);

dev.off();

