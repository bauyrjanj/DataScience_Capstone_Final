library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
        
        # Application title.
        titlePanel("DATA SCIENCE CAPSTONE PROJECT - PREDICT NEXT WORD"),
        sidebarLayout(
                sidebarPanel(
                        helpText("ENTER A WORD, OR SET OF WORDS TO GET THE NEXT WORD PREDICTED"),
                        hr(),
                        textInput("obs", "Enter Your Input Text Here:", value = "you"),
                        submitButton("Submit"),
                        hr(),
                        helpText("1 - ONCE THE INPUT IS ENTERED AND SUBMITTED, THE NEXT WORD IS PREDICTED AND OUTPUTTED.", 
                                 hr(),
                                 "2 - YOUR INPUT MAY BE A SINGLE WORD OR SET OF WORDS UP TO THREE WORDS.",
                                 hr(),
                                 "3 - THIS APP DOES NOT SUPPORT THE INPUT WHERE NUMBER OF WORDS IS GREATER THAN THREE",
                                 hr(),
                                 "4 - THE FUTURE IMPROVED VERSION OF THE APP WILL BE SCALED TO WORK WELL WITH THE NUMBER OF WORDS GREATER THAN THREE"),
                        hr(),
                        hr()
                        
                ),
                mainPanel(
                        h3("NEXT WORD:"),
                        textOutput("word_next"),
                        hr(),
                        strong(code(textOutput('sentence'))),
                        hr(),
                        helpText("THE PREDICTION MODEL IS BASED ON KATZ-BACK OFF ALGORITHM"),
                        hr()
                )
        )
))
