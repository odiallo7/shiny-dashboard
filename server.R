###################
# server.R
#
# For all your server needs
###################
library(plotly)
library(ggplot2)
library(ggthemes)
library(colorspace)
server <- function(input, output, session) {
  
  ####------------------affichage des graphes--------------------------------
  
  output$plot1a_1 <- output$plot1a <- output$plot1 <- renderPlotly({
    
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    #print(new_data)
    
    
    g <-
      ggplot(new_data,
             aes(
               x = new_data$Date,
               y = new_data$`Cas positifs`,
               colour = "red"
             )) +
      geom_line() +
      ylab(label = "test_positifs") +
      xlab("Date")
    g
    
    
  })
  ##fin
  
  
  output$plot1b_1 <- output$plot1b <- output$plot2 <- renderPlotly({
    #print(input$dates[1])
    #  print(df_covid$Date)
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    #print(new_data)
    
    g1 <- ggplot(new_data) +
      geom_line(aes(x = new_data$Date, y = new_data$`Cas contact`),
                colour='orange'
      ) +
      
      ylab(label = "Cas Contacts") +
      xlab("Date")
    g1
    
    
  })
  output$plot1c_1 <- output$plot1c <- output$plot3 <- renderPlotly({
    # print(input$dates[1])
    #print(df_covid$Date)
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    #print(new_data)
    
    
    g1 <- ggplot(new_data) +
      geom_line(aes(
        x = new_data$Date,
        y = new_data$`Cas gueris`
        
      ),
      
      colour ='green'
      ) +
      
      ylab(label = "Cas gueris") +
      xlab("Date")
    g1
    
    
  })
  output$plot1e_1 <-
    output$plot1d_1 <-
    output$plot1e <- output$plot1d <- output$plot4 <- renderPlotly({
      # print(input$dates[1])
      # print(df_covid$Date)
      new_data = filter(df_covid,
                        df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
      #print(new_data)
      
      
      
      #DF$Value<-round(runif(1:nrow(DF),min = 10, max = 50))
      g1 <- ggplot(new_data) +
        geom_line(aes(
          x = new_data$Date,
          y = new_data$Deces,
          #colour = "Darkblue"
        )
        ,
        colour ='red'
        
        ) +
        
        ylab(label = "Cas Deces") +
        xlab("Date")
      g1
      
      
    })
  output$plot1f_1 <- output$plot1f <- output$plot5 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    
    g1 <- ggplot(new_data) +
      geom_line(aes(
        x = new_data$Date,
        y = new_data$`Cas communautaires`,
        
      ),
      colour = "darkblue"
      ) +
      
      ylab(label = "Cas Communautaires") +
      xlab("Date")
    g1
    
    
  })
  
  
  ###-----------courbes à deux------------------------
  output$subplot1a <- output$subplot1 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(
        new_data,
        x = new_data$Date,
        y = new_data$`Cas positifs`,
        color = I("red")
      )
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(
        new_data,
        x =  new_data$Date,
        y = new_data$`Cas communautaires`,
        colors = I("Dark2")
      )
    fig2 <- fig2 %>% add_lines(name = ~ "communautaires")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot2 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`,color = I("red"))
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(new_data, x =  new_data$Date, y = new_data$`Cas contact`,color = I(	"purple"))
    fig2 <- fig2 %>% add_lines(name = ~ "contacts")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot3a <- output$subplot3 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`,color = I("red"))
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(
        new_data,
        x =  new_data$Date,
        y = new_data$`Cas gueris`,
        color = I("green")
      )
    fig2 <- fig2 %>% add_lines(name = ~ "gueris")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot4a <- output$subplot4 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`,color = I("red"))
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(new_data, x =  new_data$Date, y = new_data$Deces,color = I("darkblue"))
    fig2 <- fig2 %>% add_lines(name = ~ "Deces")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  
  # Fin 
  
  
  ##---------------------courbes à trois---------------------------
  output$manyplot <- renderPlotly({
    #new_data = filter(df_covid,df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    # print(new_data)
    ggplot(df_covid, aes(x=df_covid$Date)) +
      geom_line(aes(y = df_covid$`Cas positifs`),color="red") +
      geom_line(aes(y = df_covid$`Cas gueris`),color="green")+
      geom_line(aes(y = df_covid$`Deces`),color="steelblue")+
      scale_color_discrete(name = "Cas ", labels = c("contamminations", "guerisons", "Deces"))+
      
      ggtitle("Evolution des positif") +
      xlab("Date") + ylab("Nombre de cas") 
  })
  output$manyplotcas <- renderPlotly({
    #new_data = filter(df_covid,df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    # print(new_data)
    ggplot(df_covid, aes(x=df_covid$Date)) +
      geom_line(aes(y = df_covid$`Cas importes`), color ="orange") +
      geom_line(aes(y = df_covid$`Cas contact`),color="green")+
      geom_line(aes(y = df_covid$`Cas communautaires`),color="red")+
      # scale_size_area("Nitrogen") + 
      
      ggtitle("Evolution des positif") +
      xlab("Date") + ylab("Nombre de cas") 
    # labs( "Cas")
    
    
    
  })
  
  
  ###------------------VALBOX--------------
  
  output$value <- renderPrint({
    input$dates
  })
  output$valuebox_total_cases_1 <-
    output$valuebox_total_cases <- renderValueBox({
      sum(df_covid$`Cas positifs`)%>%as.integer()%>%round()%>%
        valueBox(
          "Total Cas positif",
          icon = icon("ambulance"),
          color = "orange"
        )
      
    })
  
  
  output$valuebox_total_cases_1a <-
    output$valuebox_total_cases <- renderValueBox({
      sum(df_covid$`Cas contact`)%>%as.integer()%>%round()%>%
        
        valueBox(
          "Total cas contact",
          icon = icon("home"),
          color = "green"
        )
      
    })
  output$valuebox_total_cases_1b <-
    output$valuebox_total_cases <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas communautaires`),
          nsmall = 1,
          big.mark = ","
        ),
        "Total cas communautaire",
        icon = icon("exclamation-triangle"),
        color = "red"
      )
      
    })
  output$valuebox_total_cases_1c <-
    output$valuebox_total_cases <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas importes`),
          nsmall = 1,
          big.mark = ","
        ),
        "Total cas importes",
        icon = icon("plane"),
        color = "orange"
      )
      
    }) 
  
  
  ###-------------------------------boXDEATH-----------------------
  output$valuebox_total_deaths_1 <-
    output$valuebox_total_deaths <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$Deces),
          nsmall = 1,
          big.mark = ","
        ),
        "nombre total de morts confirmees",
        icon = icon("skull"),
        color = "red"
      )
      
    })
  output$valuebox_death_rate_1 <-
    output$valuebox_death_rate <- renderValueBox({
      valueBox(
        paste0(round(
          sum(df_covid$Deces) / sum(df_covid$`Cas positifs`),
          digits = 4
        ) * 100, "%"),
        "Taux de deces ",
        icon = icon("exclamation-triangle"),
        color = "maroon"
      )
      
    })
  output$valuebox_recov_rate_1 <-
    output$valuebox_recov_rate <- renderValueBox({
      valueBox(
        paste0(round(
          sum(df_covid$`Cas gueris`) / sum(df_covid$`Cas positifs`),
          digits = 4
        ) * 100, "%"),
        "taux de guerisons",
        icon = icon("star-of-life"),
        color = "green"
      )
      
    })
  
  output$valuebox_total_active_1 <-
    output$valuebox_total_active <- renderValueBox({
      (sum(df_covid$`Cas positifs`) - (sum(df_covid$Deces) +sum(df_covid$`Cas gueris`)))%>%as.integer()%>%round()%>%
        valueBox(
          "Nombre total de cas en traitements",
          icon = icon("hospital-alt"),
          color = "yellow"
        )
      
    })
  
  
  output$valuebox_total_recov_1 <-
    output$valuebox_total_recov <- renderValueBox({
      sum(df_covid$`Cas gueris`)%>%as.integer()%>%round()%>%
        
        valueBox(
          "Nombre de gueris",
          icon = icon("star-of-life"),
          color = "green"
        )
    })
  
  output$valuebox_num_tests_pop_1 <-
    output$valuebox_num_tests_pop <- renderValueBox({
      sum(df_covid$`Cas testes`)%>%as.integer()%>%round()%>%
        valueBox(
          
          "Nombre de tests ",
          icon = icon("vials"),
          color = "olive"
        )
    })
  output$valuebox_positivetests_rate_1 <-
    output$valuebox_positivetests_rate <- renderValueBox({
      valueBox(
        paste0((
          round(sum(df_covid$`Cas positifs`) / sum(df_covid$`Cas testes`),digits = 4)
        ) * 100  ,"%"),
        
        
        "Taux de positivite",
        icon = icon("vial"),
        color = "maroon"
      )
      
    })
  
  output$dt_covid <- renderDataTable({
    #data_covid=copy_to(data_covid)
    df_covid
    
  })
  
}
