library(shiny)
# use this code to initialize any basic app
# can also use shiny wizard in R studio or R snippets

# best practice is to separate ui file as ui.R and server file as server.R
# (won't need to call "shinyapp" function)

# do any processing here, use ui function to display in app

ui <- fluidPage(
  "hello"
  #to display vectors, use paste & collapse
  # all arguments must be comma separated
  # to call html directly use html()
)

server <- function(input, output) {
  #requires parameters named input and output
  #output plot require a render function
  # can access variables (or element ids) from "input" data frame
  # print to console with observe({}),
  # create variables (as functions) with reactive({})
}

shinyApp(ui = ui, server = server)
# no code after initializing the app
