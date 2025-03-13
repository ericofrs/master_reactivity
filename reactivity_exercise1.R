data(iris)
library(shiny)

ui <- fluidPage(
  titlePanel("iris"),
  sidebarLayout(
    sidebarPanel(
      selectInput( # First input
        inputId = "species",
        label = "Choose the species",
        choices = unique(iris$Species)
      ),
      sliderInput( # Second input, which will be a vector with two values
        inputId = "sepal_length",
        label = "Select the sepal length range",
        min = min(iris$Sepal.Length), max = max(iris$Sepal.Length),
        value = c(5, 6.5)
      ),
      actionButton(inputId = "filter_btn", 
                   label = "Filter Data"
                   )
      ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  
  data <- reactive({
    subset(
      iris,
      Species == input$species
    )
  })
  
  # data <- eventReactive(input$filter_btn, {
  #   data() |>
  #     filter(Sepal.Length > input$sepal_length[1], Sepal.Length < input$sepal_length[2])
  # })

  #observe()
  
  output$plot <- renderPlot({
    plot(
      x = data()$Sepal.Length,
      y = data()$Sepal.Width
    )
  })
}

shinyApp(ui, server)