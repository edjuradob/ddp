

getDivPeriods<-function(period){
  result<-1
  if (period=="weekly"){
    result<-52
  }else if(period=="15 days"){
    result<-24
  }else if(period=="monthly"){
    result<-12
  } 
  result
}

calculateWage<-function(wage,period){
  percentage<-0
  if(wage<10000){
    percentage<-0.1
  }else if(wage<20000){
    percentage<-0.12
  }else if(wage<=30000){
    percentage<-0.15
  }else if(wage<=50000){
    percentage<-0.2
  }else if(wage<=80000){
    percentage<-0.3
  }else {
    percentage<-0.4
  }
    
  
  (as.numeric(wage)*(1-percentage)) /getDivPeriods(period) 
} 

shinyServer(
  function(input, output) { 
    output$wage <- renderPrint({input$wage})
    output$period <- renderPrint({input$period})
    output$netWage<-renderPrint(calculateWage({input$wage},{input$period}))


    
  }
)