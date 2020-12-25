###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {
  
  output$progressBox <- renderValueBox({
    valueBox(
      paste0(0.5, "%"), "de la population", icon = icon("list"),
      color = "purple"
    )
  })
  
  
  
  
  
  histPlot_df <- eventReactive(
    input$submit,
    {
      df[[ input$columnChoice ]]
    })
  
  output$histPlot <- renderPlot({
    data <- histPlot_df()[ seq_len(input$slider) ]
    hist(data)
  })
  
}
