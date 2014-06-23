library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      numericInput('height', 'Height (cm)', 150, min = 10, max = 300),
      numericInput('weight', 'Weight (kg)', 50, min = 10, max = 300, step = 0.1),
      submitButton('Submit'),
      
      helpText(""),
      helpText("Instructions:"),
      helpText("1. Enter your height in cm"),
      helpText("2. Enter your weight in kg"),
      helpText("3. Press \"Submit\" button"),
      helpText("Your BMI and classification will be displayed on the Results panel."),
      helpText("BMI classification is adapted from ",  
               a("World Health Organization", href = "http://apps.who.int/bmi/index.jsp?introPage=intro_3.html"), 
               "'s data."),
      a("Presentation for this app", href="http://rubyrail.github.io/bmicalcSlides")
    ),
    mainPanel(
      h3('Results'),
      h4('Height you entered (cm)'),
      verbatimTextOutput("inputHeight"),
      h4('Weight you entered (kg)'),
      verbatimTextOutput("inputWeight"),
      h4('Your BMI'),
      verbatimTextOutput("bmi"),
      h4('Your BMI Classification (for Adults)'),
      verbatimTextOutput("bmiClass")
    )
  )
)
