###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
sidebar <- dashboardSidebar(
  sidebarMenu(

    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Contaminations", tabName = "contaminations", icon = icon("plus")),
    menuItem("Guerisions", tabName = "guerisions", icon = icon("ok", lib = "glyphicon")),
    menuItem("Cas de deces", tabName = "deaths", icon = icon("remove", lib = "glyphicon")),
    menuItem("Database", tabName = "database", icon = icon("database")),
    tags$hr(),
    dateRangeInput("dates", label = p("choisir periode d'etude des cas"),start = "2020-04-01",end = "2020-06-30"),
    tags$hr(),
   # menuItem("choix cas", tabName = "main_menu", icon = icon("th")),
    
    menuItem("Cas Positifs ", tabName = "positif", icon = icon("plus")),
    menuItem("Cas Contacts ", tabName = "contact", icon = icon("hand-spock")),
    menuItem("gueris", tabName = "gueris", icon = icon("check-circle")),
    menuItem("Cas de deces", tabName = "deces", icon = icon("remove", lib = "glyphicon")),
    menuItem("Details des contaminations", tabName = "communautaire", icon = icon("walking"))
    
    #menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    
  )
)
