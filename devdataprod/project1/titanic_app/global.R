library(e1071,        warn.conflicts = FALSE, quietly = TRUE);
library(randomForest, warn.conflicts = FALSE, quietly = TRUE);
library(caret,        warn.conflicts = FALSE, quietly = TRUE);

source('titanic.R');

data  <- load_training_data();

model <- train(
    Survived ~ ., 
    method     = 'rf', 
    data       = data,
    trControl  = trainControl(method = 'oob', number = 4)
);
