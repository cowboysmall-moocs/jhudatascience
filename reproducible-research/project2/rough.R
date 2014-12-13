
    if (!require('plyr')) {

        install.packages('plyr');
        require('plyr');
    }


    storm_data$propdmgexp[storm_data$propdmgexp %in% c('', '+', '?', '-')] <- '0';
    storm_data$propdmgexp[storm_data$propdmgexp %in% c('h', 'H')]          <- '2';
    storm_data$propdmgexp[storm_data$propdmgexp %in% c('k', 'K')]          <- '3';
    storm_data$propdmgexp[storm_data$propdmgexp %in% c('m', 'M')]          <- '6';
    storm_data$propdmgexp[storm_data$propdmgexp %in% c('b', 'B')]          <- '9';

    storm_data$propdmgexp <- as.numeric(storm_data$propdmgexp);





    storm_data$cropdmgexp[storm_data$cropdmgexp %in% c('', '+', '?', '-')] <- '0';
    storm_data$cropdmgexp[storm_data$cropdmgexp %in% c('h', 'H')]          <- '2';
    storm_data$cropdmgexp[storm_data$cropdmgexp %in% c('k', 'K')]          <- '3';
    storm_data$cropdmgexp[storm_data$cropdmgexp %in% c('m', 'M')]          <- '6';
    storm_data$cropdmgexp[storm_data$cropdmgexp %in% c('b', 'B')]          <- '9';

    storm_data$cropdmgexp <- as.numeric(storm_data$cropdmgexp);
