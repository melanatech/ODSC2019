library(shiny)

players <- read.csv("data/nba2018.csv")

ui <- fluidPage(
  titlePanel("NBA Players 2018"),
  sidebarLayout(
    sidebarPanel(
      "This is a side panel"
    ),
    mainPanel(
      "And this is the main stuff"
    )
  ),
  h1("# of Players"),
  "(",
  strong(nrow(players)),
  ")"
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
