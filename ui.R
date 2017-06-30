library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Color Palette from Image"),

  # Color Sidebar with a file selector and slider input for number of colors output
  sidebarLayout(
        sidebarPanel(
            helpText("Create a color palette from an image by choosing an input file and selecting the number of colors"),
            #Selector for file upload
            fileInput('datafile', 'Choose JPG image file',
                    accept=c('.jpg', 'jpg image file')),
            sliderInput("colors",
                "Number of colors for the palette:",
                min = 4,
                max = 30,
                value = 8),
            
            helpText("The colors may change slightly depending on the number of clustering iterations chosen"),
            sliderInput("iter",
                "Max number of iterations:",
                min = 5,
                max = 20,
                value = 10),
            helpText(""),
            helpText("Thanks to Andrea Cirillo for illustrating the clustering approach")      
        ),
        
    # Show a plot of the generated distribution
    mainPanel(
        imageOutput("pic1", height = 300, width = 500),
        imageOutput("pal1", height = 500, width = 500)
    )
  )
))
