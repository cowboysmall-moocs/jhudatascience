library(shiny)

shinyServer(

    function(input, output, session) {

        observe({

            ifelse(
                input$Sex == 'male',
                updateSelectInput(
                    session, 
                    'Title', 
                    label    = 'Title', 
                    choices  = c('Master', 'Mr', 'Sir'), 
                    selected = 'Master'
                ),
                updateSelectInput(
                    session, 
                    'Title', 
                    label    = 'Title', 
                    choices  = c('Miss', 'Ms', 'Lady'), 
                    selected = 'Miss'
                )
            )
        })

        observe({

            title <- input$Title

            updateNumericInput(
                session,
                'Age', 
                label = 'Age', 
                value = trunc(median(data[data$Title == title, ]$Age)), 
                min   = trunc(min(data[data$Title == title, ]$Age)), 
                max   = trunc(max(data[data$Title == title, ]$Age))
            )
        })

        df <- reactive({

            df <- data.frame(
                Pclass     = as.numeric(input$Pclass), 
                Sex        = input$Sex, 
                Age        = input$Age, 
                Embarked   = input$Embarked, 
                Title      = input$Title, 
                FamilySize = input$FamilySize
            )
        })

        output$Prediction <- renderText({

            ifelse(
                as.numeric(predict(model, df())) == 1, 
                'Sadly it seems you will perish. Dash it all!', 
                'It looks like you will survive! Huzzah!'
            )
        })

        output$TitanicTable <- renderDataTable(data, options = list(pageLength = 5))
    }
)
