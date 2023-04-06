library(shiny)
library(DelayedArray)

ui <- basicPage(
  title = "A shiny app with BioC Deps",
  DT::dataTableOutput("pkgs")
)

server <- function(input, output, session) {
  output$pkgs <- DT::renderDataTable(as.data.frame(installed.packages()))
}

shinyApp(ui, server)
