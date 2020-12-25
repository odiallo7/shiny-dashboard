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
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    
  )
)
