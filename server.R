library(shiny)

calBMI <- function(height, weight) round(weight / (height / 100)^2, 1)
classifyBMI <- function(bmi) {
  if (bmi < 18.5) {
    return("Underweight")
  } else if (bmi >= 18.5 & bmi < 25) {
    return("Normal")
  } else if (bmi >= 25 & bmi < 30) {
    return("Overweight")
  } else if (bmi >= 30) {
    return("Obese")
  }
} 

shinyServer(function(input, output) {
  output$inputHeight <- renderPrint(input$height)
  output$inputWeight <- renderPrint(input$weight)
  bmi <- reactive(calBMI(input$height, input$weight))
  output$bmi <- renderPrint({bmi()})
  output$bmiClass <- renderPrint(classifyBMI({bmi()}))
})