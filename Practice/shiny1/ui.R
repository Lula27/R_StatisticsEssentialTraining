# Developing Shiny App from tutorial 
browseURL("https://www.youtube.com/watch?v=Gyrfsrd4zK0&ab_channel=ehsanjahanpour")


shinyServer(
  pageWithSidebar(
    headerPanel("My First Shiny App"),
    
    sidebarPanel("Side Bar"),
    
    mainPanel("Main Panel")
  )
)