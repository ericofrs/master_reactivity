library(shiny)

ui <- fluidPage(
  titlePanel("Hello"),
  mainPanel(
    textInput(inputId = "username", 
              label = "Your name:"),
    actionButton(inputId = "btn1", 
                 label = "Add Score" 
                 ),
    actionButton(inputId = "btn2", 
                 label = "Reset Score"
                 ),
    textOutput(outputId = "txtusername"),
    textOutput(outputId = "txtscore")
    )
  )

server <- function(input, output, session) {
  values <- reactiveValues(
    score = 0,
    user_name = ""
    )
  
  observeEvent(input$btn1, {
    values$score <- values$score + 1
    })

  observeEvent(input$btn2, {
    values$score <- values$score - 1
    })
  
  observeEvent(input$username, {
    req(input$username)
    values$user_name <- input$username
  })
  
  output$txtusername <- renderText({
    sprintf("Thank you, %s!", values$user_name)
    })
  output$txtscore <- renderText({
    sprintf("Your current score is: %d", values$score)
  })
}

shinyApp(ui, server)