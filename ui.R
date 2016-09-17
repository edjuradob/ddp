
library(shiny)
shinyUI(pageWithSidebar(  
  
  headerPanel("Net wage calculator"),  
  sidebarPanel(    
    
    numericInput('wage', 'Yearly salary (in UDS dollars)', 20000, min = 1500, step = 500),
    selectizeInput(
      'period', label = "Period to calculate salary", choices = unique(c("weekly", "15 days", "monthly", "yearly"))
    ),
#     numericInput('period', 'Tree height', 90, min = 50, max = 200, step = 5),
    submitButton('Submit')
    
  ),
  mainPanel(
    h3('Results of prediction'),
    h4('You entered a yearly wage of '),
    verbatimTextOutput("wage"),
    h4(' and period'),
    verbatimTextOutput("period"),
    h4(' Your net wage for that period is'),
    verbatimTextOutput("netWage")
    #         verbatimTextOutput("nd1")
    #     h4('Resulted in a prediction of ')
    #     verbatimTextOutput("prediction")
  )
)
)