#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Central Limit Theorm (CLT) Demo :"),
  h3("CLT states that the distribution of averages of iid variables (properly normalized) becomes that of a standard normal as the sample size increases."),
  
  # Sidebar with a slider input for number of Random Numbers to Generate 
  sidebarLayout(
    sidebarPanel(
        em("Selected the count of Random numbers to generate and number of simulation out of these random numbers"),
       sliderInput("count", "Number of Random Numbers to generate:", min = 100, max = 500, value = 300),
       sliderInput("simulate", "Number of Simulations to generate:", min = 500, max = 5000, value = 500)
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       p("The central Limit Theorm establishes that, in most situations, when independent random variables are added, their properly normalized sum tends toward a normal distribution a bell curve, even if the original variables themselves are not normally distributed."),
       p("The theorem is a key concept in probability theory because it implies that probabilistic and statistical methods that work for normal distributions can be applicable to many problems involving other types of distributions"),
       p("In this project, we generate the random numbers by exponential distribution in R and compare it with the Central Limit Theorem. "),
       p("We will investigate the distribution of averages of n random numbers, where n is selected from the slider."),
       p("We will do number of the simulations as per the input from the second slider."),
       strong("The plot of the normal curve over the Histogram of the Simulated Mean of Random Numbers, clearly shows that mean of simulated data follows a normal distribution with the mean convergent with the mean of the orginal random numbers."),
       h2("Histogram of the Original Random Numbers"),                
       plotOutput("distPlot"),
       h3("Output Mean of Original Distribution"),
       textOutput("mean1"),
       
       
       h2("Histogram of the Simulated Mean of Random Numbers"),                
       plotOutput("distPlot1"),
       h3("Output Mean of Simulated Distribution"),
       textOutput("mean2")
    )
  )
))
