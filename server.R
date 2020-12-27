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
  output$progressBox <- renderValueBox({
    valueBox(paste0(0.5, "%"),
             "de la population",
             icon = icon("list"),
             color = "purple")
  })
  
  
  
  
  
  histPlot_df <- eventReactive(input$submit,
                               {
                                 df[[input$columnChoice]]
                               })
  
  output$histPlot <- renderPlot({
    rp = c((format(
      sum(df_covid$`Cas positifs`),
      nsmall = 1,
      big.mark = ","
    )),
    (paste0((
      sum(df_covid$`Cas positifs`) / sum(df_covid$`Cas testes`)
    ) * 100, 2)),
    (format(
      sum(df_covid$`Cas testes`),
      nsmall = 1,
      big.mark = ","
    )))
    rp = gsub(",", "", rp)
    
    df <- data.frame(matrix((rp), nrow = 1, byrow = TRUE))
    # print(names(df))
    # print(dim(df))
    
    #ggplot(df, aes(x="matrix..rp...nrow...3..byrow...FALSE",)) + geom_bar(stat='identity')
    
    ggplot(df) + geom_bar(aes(x = "x1"), fill = "darkblue", width = .5)
    
    
  })
  ####affichage des graphes
  output$plot1a_1 <- output$plot1a <- output$plot1 <- renderPlotly({
    print(input$dates[1])
    print(df_covid$Date)
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
  
  ##-------affichage des graphes-------
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
      
      ylab(label = "Cas guueris") +
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
  
  output$subplot1a <- output$subplot1 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(
        new_data,
        x = new_data$Date,
        y = new_data$`Cas positifs`,
        color = "red"
      )
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(
        economics,
        x =  new_data$Date,
        y = new_data$`Cas communautaires`,
        colors = "Dark2"
      )
    fig2 <- fig2 %>% add_lines(name = ~ "communautaires")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot2 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`)
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(economics, x =  new_data$Date, y = new_data$`Cas contact`)
    fig2 <- fig2 %>% add_lines(name = ~ "contacts")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot3a <- output$subplot3 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`)
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(
        economics,
        x =  new_data$Date,
        y = new_data$`Cas gueris`,
        colors = ""
      )
    fig2 <- fig2 %>% add_lines(name = ~ "gueris")
    fig <- subplot(fig1, fig2)
    
    fig
    
    
  })
  output$subplot4a <- output$subplot4 <- renderPlotly({
    new_data = filter(df_covid,
                      df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    fig1 <-
      plot_ly(new_data, x = new_data$Date, y = new_data$`Cas positifs`)
    fig1 <- fig1 %>% add_lines(name = ~ "positifs")
    fig2 <-
      plot_ly(economics, x =  new_data$Date, y = new_data$Deces)
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
      scale_color_discrete(name = "Cas ", labels = c("contamminations", "guerisons", "Deces"))
    
  })
  output$manyplotcas <- renderPlotly({
    #new_data = filter(df_covid,df_covid$Date >= input$dates[1] & df_covid$Date <= input$dates[2])
    # print(new_data)
    ggplot(df_covid, aes(x=df_covid$Date)) +
      geom_line(aes(y = df_covid$`Cas importes`), color ="orange") +
      geom_line(aes(y = df_covid$`Cas contact`),color="green")+
      geom_line(aes(y = df_covid$`Cas communautaires`),color="red")+
      scale_size_area("Nitrogen") + 
      ggtitle("Evolution des cas positifs") +
      xlab("Date") + ylab("Nombre de cas") 
     # labs( "Cas")
    
    
    
  })
  
  ##------------------VALBOX--------------
  
  output$value <- renderPrint({
    input$dates
  })
  output$valuebox_total_cases_1 <-
    output$valuebox_total_cases <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas positifs`),
          nsmall = 1,
          big.mark = ","
        ),
        "Total confirmed cases",
        icon = icon("ambulance"),
        color = "orange"
      )
      
    })
  #------ValueBox de cas posititifs--------
  
  output$valuebox_total_cases_1a <-
    output$valuebox_total_cases <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas contact`),
          nsmall = 1,
          big.mark = ","
        ),
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
  
  #-----------Fin--------------
  
  output$valuebox_total_deaths_1 <-
    output$valuebox_total_deaths <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$Deces),
          nsmall = 1,
          big.mark = ","
        ),
        "Total confirmed deaths",
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
        "Death rate",
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
        "Death rate",
        icon = icon("star-of-life"),
        color = "green"
      )
      
    })
  
  output$valuebox_total_active_1 <-
    output$valuebox_total_active <- renderValueBox({
      cas_en_traitemment = sum(df_covid$`Cas positifs`) - (sum(df_covid$Deces) +
                                                             sum(df_covid$`Cas gueris`))
      
      valueBox(
        format(
          cas_en_traitemment,
          nsmall = 1,
          big.mark = ","
        ),
        "Nombre total en traitements",
        icon = icon("hospital-alt"),
        color = "yellow"
      )
      
    })
  
  
  output$valuebox_total_recov_1 <-
    output$valuebox_total_recov <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas gueris`),
          nsmall = 1,
          big.mark = ","
        ),
        "Total confirmed recovered cases",
        icon = icon("star-of-life"),
        color = "green"
      )
    })
  
  output$valuebox_num_tests_pop_1 <-
    output$valuebox_num_tests_pop <- renderValueBox({
      valueBox(
        format(
          sum(df_covid$`Cas testes`),
          nsmall = 1,
          big.mark = ","
        ),
        "Number of tests per  million population",
        icon = icon("vials"),
        color = "olive"
      )
    })
  output$valuebox_positivetests_rate_1 <-
    output$valuebox_positivetests_rate <- renderValueBox({
      valueBox(
        paste0((
          sum(df_covid$`Cas positifs`) / sum(df_covid$`Cas testes`)
        ) * 100, 2, "%"),
        
        
        "Positive tests rate",
        icon = icon("vial"),
        color = "maroon"
      )
      
    })
  
  output$dt_covid <- renderDataTable({
    #data_covid=copy_to(data_covid)
    df_covid
    
  })
  
}
