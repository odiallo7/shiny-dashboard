###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
body <- dashboardBody(
  tabItems(
    
    ########################
    # First tab content
    tabItem(
      tabName = "dashboard",
      h2("La partie vue d'ensemble !")
    ),
    
    ########################
    # 2nd tab Contamination
    tabItem(tabName = "contaminations",
            fluidRow(
              h2("La partie vue contaminations !")
            ),
            fluidRow(
              # A static valueBox
              valueBox(sum(positve_case$`Cas positifs`), "Total Contaminations", color = "red", icon = icon("credit-card")),
              valueBox(positive_rate, "de positivité", icon = icon("list")),
              
              # Dynamic valueBoxes
              valueBoxOutput("progressBox")
            )
            
    ),
    
    ########################
    # third tab healed
    tabItem(tabName = "guerisions",
            fluidRow(
              h2("La partie vue guérison !")
            )    
    ),
    
    ########################
    # 4th tab death
    tabItem(tabName = "deaths",
            fluidRow(
              h2("La partie vue décès !")
            )
    ),
    
    ########################
    # Last tab content 
    tabItem(
      tabName = "widgets",
      fluidRow(
        
        # CONTROLS
        box(
          
          title = "Controls",
          
          # Choose a column
          selectInput(
            "columnChoice",
            "Choose a column:",
            choices = colnames(df),
            selected = "n"),
          
          sliderInput("slider", "Number of observations:", 1, 100, 50),
          
          # Create an eventReactive element
          actionButton(
            inputId = "submit",
            label = "Submit column")
          
        ),
        # PLOT THE THTINGS
        box( plotOutput("histPlot") )
      )
    )
  )
)
