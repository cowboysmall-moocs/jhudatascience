
if (!require('reshape2')) {

    install.packages('reshape2');
    require('reshape2');
}


NEI_Baltimore <- subset(readRDS("./data/summarySCC_PM25.rds"), fips == 24510);


NEI_long <- melt(NEI_Baltimore, id.vars = "year", measure.vars = "Emissions");
NEI_wide <- dcast(NEI_long, year ~ variable, sum);


png(file = "plot2.png", width = 640, height = 480);

plot(NEI_wide$year,
    NEI_wide$Emissions,
    type = "l", 
    xlab = "Years", 
    ylab = "Total" ~ PM[2.5] ~ "Emissions", 
    main = "Total" ~ PM[2.5] ~ "Emissions (Baltimore City)",
    col  = "red"
);

dev.off();

# barplot(NEI_wide$Emissions,
#     names = NEI_wide$year,
#     xlab = "Years", 
#     ylab = "Total" ~ PM[2.5] ~ "Emissions", 
#     main = "Total" ~ PM[2.5] ~ "Emissions (Baltimore City)"
# );
