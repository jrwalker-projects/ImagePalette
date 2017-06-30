
library(shiny); library(jpeg); library(scales)

#paletter library routine cloned locally here for now to allow external access to number of iterations
#from AndreaCirilloAC/paletter

palette_maker <- function(image_rgb = NA, number_of_colors = 20, iter = 30){
    dimension    <- dim(painting)
    painting_rgb <- data.frame(
        x = rep(1:dimension[2], each = dimension[1]),
        y = rep(dimension[1]:1, dimension[2]),
        R = as.vector(painting[,,1]),
        G = as.vector(painting[,,2]),
        B = as.vector(painting[,,3])
        )
    k_means <- kmeans(painting_rgb[,c("R","G","B")], centers = number_of_colors, iter.max = iter)
    colours_k <- rgb(k_means$centers[k_means$cluster,])
    return(unique(colours_k))
}    

shinyServer(function(input, output) {
    get_file<- eventReactive(input$datafile, {
        infile <- input$datafile
        if (is.null(infile)) {
            #don't have an input file yet
        } else {
            painting <<- readJPEG(infile$datapath)
            writeJPEG(painting, "image.jpg")
        }
    })
    create_palette <- reactive({
        infile <- input$datafile
        if (is.null(infile)) {
            #don't have an input file yet
        } else {
            colours_vector <- palette_maker(painting, number_of_colors = input$colors, iter = input$iter)
            png("mypal.png", bg = "transparent")
            show_col(colours_vector)
            dev.off()
        }
    })
    output$pic1 <- renderImage({
        get_file()
        list(src = "image.jpg", width = 500, height = 300)
        }, deleteFile = TRUE
    )
    output$pal1 <- renderImage({
        create_palette()
        list(src = "mypal.png", width = 500, height = 500)
        }, deleteFile = TRUE 
    )
})
