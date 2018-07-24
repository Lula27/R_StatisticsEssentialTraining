# ui.R 
fluidPage(
  # Application title 
  titlePanel("Word Cloud"), 
  
  sidebarLayout(
    # Sidebar w/ a slider and selection inputs 
    sidebarPanel(
      selectInput("selection", "Choose a book:", 
                  choice = books),
      actionButton("update", "Change"),
      hr(), 
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1, max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1, max = 300, value = 100)
    ), 
    mainPanel(
      plotOutput("plot")
    )
  )
)


