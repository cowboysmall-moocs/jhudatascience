library(shiny)

shinyUI(
    fluidPage(
        titlePanel("Surviving the Titanic"),
        sidebarLayout(
            sidebarPanel(
                p('Will You Survive? Select relevant details from the options below and see if you will survive.'),
                br(),
                br(),
                selectInput(
                    'Embarked', 
                    label    = 'Travelling From', 
                    choices  = c('Cherbourg' = 'C', 'Queenstown' = 'Q', 'Southampton' = 'S'), 
                    selected = 'S' 
                ),
                helpText(
                    'Note: the Titanic stopped at three ports before setting of on',  
                    'it\'s ill-fated journey to New York'
                ),
                selectInput(
                    'Pclass', 
                    label    = 'Travelling Class', 
                    choices  = c('First' = 1, 'Second' = 2, 'Third' = 3), 
                    selected = 1
                ),
                helpText('Note: people emigrating to the US travelled in third class'),
                radioButtons(
                    'Sex', 
                    label    = 'Gender', 
                    choices  = c('Male' = 'male', 'Female' = 'female'), 
                    selected = 'male', 
                    inline   = TRUE
                ),
                selectInput(
                    'Title', 
                    label    = 'Title', 
                    choices  = levels(data$Title), 
                    selected = 'Master',
                ),
                helpText('Note: titles reflect social position'),
                numericInput('Age', label = 'Age', value = 0),
                numericInput('FamilySize', label = 'Family Size', value = 1), 
                helpText(
                    'Note: this figure should reflect the total number of family ',
                    'members travelling together'
                )
            ),
            mainPanel(
                tabsetPanel(
                    tabPanel(
                        'Outcome', 
                        br(),
                        br(),
                        htmlOutput('Prediction')
                    ), 
                    tabPanel(
                        'Documentation', 
                        h3('Data'),
                        p('the data was liberated from ', 
                            a('Kaggle', href = 'https://www.kaggle.com/c/titanic-gettingStarted/data'),
                            '. Analysis was performed and only the most influential features were retained.',
                            ' Also, a number of derived features were added.'
                        ),
                        br(),
                        p('The data in searchable format is included below:'),
                        dataTableOutput('TitanicTable'),
                        h3('Algorithm'),
                        p('after trying a number of different classifiers (see analysis document in the ',
                            'repository) I settled on Random Forest, which was the best performing classifier. '
                        ),
                        h3('Code'),
                        p('all code can be viewed below, or alternatively on ',
                            a('GitHub', href = 'https://github.com/cowboysmall/jhudatascience')
                        )
                    ), 
                    tabPanel(
                        'History', 
                        br(), 
                        br(), 
                        p('from Wikipedia:'),

                        img(src = 'titanic.jpg', height = 300),
                        br(),
                        br(),
                        em('RMS Titanic was a British passenger liner that sank in the North Atlantic Ocean 
                            in the early morning of 15 April 1912 after colliding with an iceberg during her 
                            maiden voyage from Southampton, UK to New York City, US. The sinking resulted in 
                            the loss of more than 1,500 passengers and crew making it one of the deadliest 
                            commercial peacetime maritime disasters in modern history. '),
                        br(),
                        br(),
                        em('The RMS Titanic, the largest ship afloat at the time it entered service, was the 
                            second of three Olympic class ocean liners operated by the White Star Line, and 
                            was built by the Harland and Wolff shipyard in Belfast with Thomas Andrews as her 
                            naval architect. Andrews was among those lost in the sinking. On her maiden voyage, 
                            she carried 2,224 passengers and crew.')
                    )
                )
            )
        )
    )
)
