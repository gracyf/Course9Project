#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
          
        distmean <- reactive({
                set.seed(0)
                randomNumCount <- input$count
                distribution <- rexp(randomNumCount,0.2)
                mean(distribution)
        })
        
   
        output$distPlot <- renderPlot({
                # generate bins based on input$bins from ui.R
                #bins <- seq(min(x), max(x), length.out = input$bins + 1)
                set.seed(0)
                randomNumCount <- input$count
                distribution <- rexp(randomNumCount,0.2)
                # draw the histogram with the specified number of bins
                h <- hist(distribution, breaks = 30,  col = 'darkgray', border = 'white')
                xfit<-seq(min(distribution),max(distribution),length=length(distribution)) 
                yfit<-dnorm(xfit,mean=mean(distribution),sd=sd(distribution)) 
                yfit <- yfit*diff(h$mids[1:2])*length(distribution) 
                lines(xfit, yfit, col="blue", lwd=2)
                
                
        })
        
        output$mean1 <- renderText({
                distmean()
        })
        
        #SIMULATION
        
        simulmean <- reactive({
                set.seed(0)
                randomNumCount <- input$count
                distribution <- rexp(randomNumCount,0.2)
                simulation <- input$simulate
                resample <- matrix(sample(distribution, randomNumCount * simulation, replace=TRUE), simulation , randomNumCount)
                # apply mean funtion on the simulated matrix data
                resamplemean <- apply(resample,1,mean)
                df <- data.frame(x = resamplemean)
                # calculate the sample mean
                mean(df$x)
        })

        output$distPlot1 <- renderPlot({
                # generate bins based on input$bins from ui.R
                #bins <- seq(min(x), max(x), length.out = input$bins + 1)
                set.seed(0)
                randomNumCount <- input$count
                distribution <- rexp(randomNumCount,0.2)
                simulation <- input$simulate
                resample <- matrix(sample(distribution, randomNumCount * simulation, replace=TRUE), simulation , randomNumCount)
                # apply mean funtion on the simulated matrix data
                resamplemean <- apply(resample,1,mean)
                
                df <- data.frame(x = resamplemean)
                
                h1 <- hist(df$x, breaks=30, col = 'magenta' , border = 'black')
                xfit<-seq(min(df$x),max(df$x),length=length(df$x)) 
                yfit<-dnorm(xfit,mean=mean(df$x),sd=sd(df$x)) 
                yfit <- yfit*diff(h1$mids[1:2])*length(df$x) 
                lines(xfit, yfit, col="blue", lwd=2)
                
                
        })
        
        
        output$mean2 <- renderText({
                simulmean()
        })
})
