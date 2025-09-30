library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0),
            actionButton(inputId = "Add",
                         label = "Lets Add Them!"),
            actionButton(inputId = "Mult",
                         label = "Lets Multiply Them!")
        ),
        mainPanel(
          textOutput("sum"),
          textOutput("multiply")
        )
    )
)

server <- function(input, output) {
  x1 <- reactive(as.numeric(input$number1))
  x2 <- reactive(as.numeric(input$number2))
  
  observeEvent(input$Add, {
      output$sum <- renderText({
      x1() + x2()
    })
      output$multiply <- renderText({
        ""
      })
  })
  observeEvent(input$Mult, {
      output$multiply <- renderText({
      x1() * x2()
    })
      output$sum <- renderText({
        ""
      })
  })
}

shinyApp(ui = ui, server = server)


