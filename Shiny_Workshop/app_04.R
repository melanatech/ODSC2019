library(shiny)

players <- read.csv("data/nba2018.csv")

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
        value = 3
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
        nrow(players),
        "players in the dataset"
      ),
      plotOutput("nbaplot", width = "300px"),
      tableOutput("playerdata"),
    )
  )
)

server <- function(input, output, session) {
  output$nbaplot <-renderPlot({
    plot(rnorm(input$VORP))
    })
}
shinyApp(ui, server)
