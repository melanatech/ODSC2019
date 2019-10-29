library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

players <- read.csv("data/nba2018.csv")

#filter_data(in1, in2){
#  d <- players %>%
#    filter(VORP >= in1,
#           Team %in% in2)
#
#  return(d)
#}

ui <- fluidPage(
  titlePanel("NBA 2018/19 Player Stats"),
  sidebarLayout(
    sidebarPanel(
      "Exploring all player stats from the NBA 2018/19 season",
      h3("Filters"),
      sliderInput(
        inputId = "VORP",
        label = "Player VORP rating at least",
        min = -3, max = 10,
        value = 1
      ),
      selectInput(
        "Team", "Team",
        unique(players$Team),
        selected = "Golden State Warriors"
      )
    ),
    mainPanel(
      strong(
        "There are",
        textOutput("num_players", inline = TRUE),
        "players in the dataset"
      ),
      plotOutput("nba_plot"),
      tableOutput("players_data")
    )
  )
)

server <- function(input, output, session) {

  output$players_data <- renderTable({
    data <- players %>%
      filter(VORP >= input$VORP,
             Team %in% input$Team)

    return(data)
  })

  output$num_players <- renderText({
    #data <- filter_data(input$VORP, input$Team)
    data <- players %>%
      filter(VORP >= input$VORP,
             Team %in% input$Team)

    return(nrow(data))
  })

  # Build the plot output here
  output$nba_plot <- renderPlot({
    #data <- filter_data(input$VORP, input$Team)
    data <- players %>%
      filter(VORP >= input$VORP,
             Team %in% input$Team)

    ggplot(data, aes(Salary)) + geom_histogram()
  })

}

shinyApp(ui, server)
