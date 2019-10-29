library(shiny)

players <- read.csv("data/nba2018.csv")

ui <- fluidPage(
  titlePanel("NBA 2018/19 Player Stats"),
  sidebarLayout(
    sidebarPanel(
      "Exploring all player stats from the NBA 2018/19 season",
      br(),
      sliderInput(
        inputId = "num",
        label = "Player VORP rating at least",
        min = -3,
        max = 10,
        value = 0
      ),
      h3("Filters:"),
      selectInput(
        inputId="Team",
        label = "Team",
        choices = unique(players$Team),
        selected = "Golden State Warriors"
        )
    ),
    mainPanel(
      strong(
        "There are",
        nrow(players),
        "players in the dataset"
      )
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
