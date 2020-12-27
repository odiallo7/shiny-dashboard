###################
# body.R
#
# Create the body for the ui.
# If you had multiple tabs, you could split those into their own
# components as well.
###################
library(shinyWidgets)
library(plotly)
library(DT)
library(shinycssloaders)
body <- dashboardBody(
  tabItems(
  ########################
  # First tab content
  tabItem(tabName = "dashboard",
          #h2("La partie vue d'ensemble !"),
          fluidRow(
            valueBoxOutput("valuebox_total_cases_1") %>% withSpinner(color = "#5bc0de"),
            
            
            valueBoxOutput("valuebox_positivetests_rate_1") %>% withSpinner(color = "#5bc0de"),
            
            valueBoxOutput("valuebox_num_tests_pop_1") %>% withSpinner(color = "#5bc0de"),
            valueBoxOutput("valuebox_total_recov_1") %>% withSpinner(color = "#5bc0de"),
            valueBoxOutput("valuebox_recov_rate_1") %>% withSpinner(color = "#5bc0de"),
            valueBoxOutput("valuebox_total_active_1") %>% withSpinner(color = "#5bc0de"),
           # h2("Statistique lies au nombre   deces !"),
            valueBoxOutput("valuebox_total_deaths_1") %>% withSpinner(color = "#5bc0de"),
            valueBoxOutput("valuebox_death_rate_1") %>% withSpinner(color = "#5bc0de")
          ),
          tags$br(),
        
          
          fluidRow(
            
            box(plotlyOutput(outputId = "manyplot"),width = 12),
            
            box(plotlyOutput(outputId = "subplot1")),
            box(plotlyOutput(outputId = "subplot2")),
            box(plotlyOutput(outputId = "subplot3")),
            box(plotlyOutput(outputId = "subplot4")),
            box(plotlyOutput(outputId = "plot1a_1")),
            box(plotlyOutput(outputId = "plot1b_1")),
            
          box(plotlyOutput(outputId = "plot1c_1"))%>% withSpinner(color = "#5bc0de"),
          box(plotlyOutput(outputId = "plot1d_1")),
          
          box(plotlyOutput(outputId = "plot1e_1"))%>% withSpinner(color = "#5bc0de"),
          box(plotlyOutput(outputId = "plot1f_1")),
         
          
          
          )),
  
  
  ########################
  # 2nd tab Contamination
  tabItem(
    tabName = "contaminations",
    # fluidRow(
    #   h2("La partie vue contaminations !")
    #          , tags$br(),
    #          tags$hr()),
    
    fluidRow(
      # A static valueBox
      valueBoxOutput("valuebox_total_cases") %>% withSpinner(color = "#5bc0de"),
      
      
      valueBoxOutput("valuebox_positivetests_rate") %>% withSpinner(color = "#5bc0de"),
      
      valueBoxOutput("valuebox_num_tests_pop") %>% withSpinner(color = "#5bc0de"),
      
      
      # Dynamic valueBoxes
      # valueBoxOutput("progressBox")
    ),
    tags$br(),
    tags$br(),
    fluidRow(
      box(plotlyOutput(outputId = "subplot1a")),
      box(plotlyOutput(outputId = "plot1b")),
      
      
      
    )
    
  ),
  
  ########################
  # third tab healed
  tabItem(
    tabName = "guerisions",
    fluidRow(
      h2(" Statistiques lies a la partie vue guerison !"),
      valueBoxOutput("valuebox_total_recov") %>% withSpinner(color = "#5bc0de"),
      valueBoxOutput("valuebox_recov_rate") %>% withSpinner(color = "#5bc0de"),
      valueBoxOutput("valuebox_total_active") %>% withSpinner(color = "#5bc0de"),
      
      
      
      
      
    )
    ,
    tags$br(),
    tags$br(),
    fluidRow(
      box(plotlyOutput(outputId = "plot1c"))%>% withSpinner(color = "#5bc0de"),
      box(plotlyOutput(outputId = "subplot3a")),
      
      
      
    )
  ),
  
  ########################
  # 4th tab death
  tabItem(
    tabName = "deaths",
    fluidRow(
      h2("Statistique lies au nombre   deces !"),
      valueBoxOutput("valuebox_total_deaths") %>% withSpinner(color = "#5bc0de"),
      valueBoxOutput("valuebox_death_rate") %>% withSpinner(color = "#5bc0de")
    ),
    tags$br(),
    tags$br(),
    fluidRow(
      box(plotlyOutput(outputId = "plot1e"))%>% withSpinner(color = "#5bc0de"),
      box(plotlyOutput(outputId = "subplot4a")),
      
      
      
    )
  ),
  tabItem(tabName = "database",
          fluidRow(column(
            width = 12,
            
            box(
              title = span(
                icon("table"),
                " Donness covid19 du ministere de la sante du senegal"
              ),
              footer = "jeu de donnees provenant du ministere de la sante indiquant les nombres de cas positifs,contacts communautaires ,déces liés au coronavirus .",
              status = "info",
              solidHeader = F,
              collapsible = TRUE,
              width = 12,
              collapsed = F,
              
              DTOutput("dt_covid")
            )
          )),
          tags$br()),
  
  tabItem(tabName = "positif",
          
          tags$br(),
          tags$br(),
          tags$h2("Courbe de representation des Cas Positifs"),
          
          
          plotlyOutput(outputId = "plot1")),
  
  tabItem(tabName = "contact",
          
          tags$br(),
          tags$br(),
          tags$h2("Courbe de representation des Cas Contacts"),
          
          
          plotlyOutput(outputId = "plot2")),
  
  tabItem(tabName = "gueris",
          
          tags$br(),
          tags$br(),
          tags$h2("Courbe de representation des Cas gueris"),
          
          
          plotlyOutput(outputId = "plot3")),
  
  tabItem(tabName = "deces",
          
          tags$br(),
          tags$br(),
          tags$h2("Courbe de representation des Cas de deces"),
          
          
          plotlyOutput(outputId = "plot4")),
  
  tabItem(tabName = "communautaire",
          fluidRow(
          
          valueBoxOutput("valuebox_total_cases_1a") %>% withSpinner(color = "#5bc0de"),
          valueBoxOutput("valuebox_total_cases_1b") %>% withSpinner(color = "#5bc0de"),
          
          valueBoxOutput("valuebox_total_cases_1c") %>% withSpinner(color = "#5bc0de")),
          
          
          tags$br(),
          tags$br(),

          
          plotlyOutput(outputId = "manyplotcas"))
  
))
########################
# Last tab content
# tabItem(
#   tabName = "widgets",
#   fluidRow(
#
#     # CONTROLS
#     box(
#
#       title = "Controls",
#
#       # Choose a column
#       selectInput(
#         "columnChoice",
#         "Choose a column:",
#         choices = colnames(df),
#         selected = "n"),
#
#       sliderInput("slider", "Number of observations:", 1, 100, 50),
#
#       # Create an eventReactive element
#       actionButton(
#         inputId = "submit",
#         label = "Submit column")
#
#     ),
#     # PLOT THE THTINGS
#     box( plotOutput("histPlot") )
#   )
# ),
# tabItem(
#   tabName = "main_menu",
#   valueBox(sum(positve_case$`Cas positifs`), "Total Contaminations", color = "red", icon = icon("credit-card")),
#   valueBox(positive_rate, "de positivité", icon = icon("list")),
#   valueBox(positive_rate, "de positivité", icon = icon("list")),
#
#   # Dynamic valueBoxes
#
#   h2("Choisir les cas dont vous voulez visualiser"),
#   hr(),
#   fluidRow(
#     column(
#       width = 12,
#
#       materialSwitch(
#         inputId = "cas positif",
#         label = "Cas positifs",
#         status = "danger",
#         right = TRUE
#       ),
#
#       materialSwitch(
#         inputId = "contact",
#         label = "Cas contacts",
#         status = "info",
#         right = TRUE
#       ),
#       materialSwitch(
#         inputId = "communautaire",
#         label = "Cas communautaires",
#         status = "default",
#         right = TRUE
#       ),
#
#       materialSwitch(
#         inputId = "gueris",
#         label = "Cas gueris",
#         status = "success",
#         right = TRUE
#       ),
#       materialSwitch(
#         inputId = "success",
#         label = "Cas deces",
#         status = "danger",
#         right = TRUE
#       )
#     )
#   ),
#plotlyOutput(outputId = "plot1" ))
