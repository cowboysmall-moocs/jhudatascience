
convert_title <- function(name) {
    
    title <- sub(' ', '', strsplit(name, '[,.]')[[1]][2]);
    if (title %in% c('Mlle')) {
        
        return('Miss');

    } else if (title %in% c('Mme', 'Mrs')) {
        
        return('Ms');

    } else if (title %in% c('Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer')) {
        
        return('Sir');

    } else if (title %in% c('Dona', 'Lady', 'the Countess')) {
        
        return('Lady');

    } else {
        
        title;
    }
}

clean_data <- function(data) {

    excluded               <- c('PassengerId', 'Name', 'Ticket', 'Fare', 'Cabin', 'SibSp', 'Parch');

    data$Title             <- sapply(data$Name, convert_title);
    data$Title             <- as.factor(data$Title);

    na_ages                <- is.na(data$Age);
    data$Age[na_ages]      <- median(data$Age, na.rm = TRUE);

    data$FamilySize        <- data$SibSp + data$Parch + 1;

    na_emb                 <- is.na(data$Embarked);
    data$Embarked[na_emb]  <- 'S';
    data$Embarked          <- as.factor(data$Embarked);

    return(data[, -which(colnames(data) %in% excluded)]);
}

load_training_data <- function() {

    train          <- read.csv('./data/train.csv', na.strings = c('NA', ''), stringsAsFactors = FALSE);
    train$Survived <- as.numeric(train$Survived);
    train$Survived <- as.factor(train$Survived);
    return(clean_data(train));
}

load_testing_data <- function() {

    test  <- read.csv('./data/test.csv',  na.strings = c('NA', ''), stringsAsFactors = FALSE);
    return(clean_data(test));
}
