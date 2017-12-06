# ImagePalette
Shiny app uses k-means clustering to build a color palette from an image

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)


App is at https://jrwalker.shinyapps.io/imagepalette/

The sidebar includes 
 - a file input selector (right only supports jpg images as input)
 - a slider to choose the number of colors to include in the output color palette
 - a slider to choose the maximum number of iterations of the clustering algorithm
 
 App example:
 ![Sample palette from an image of Chicago in the summer](https://raw.githubusercontent.com/jrwalker-projects/ImagePalette/master/ImagePalette.bmp)
 
 The output palette shows the colors and the hex color value.
 
 The number of iterations sometimes has an effect on the output colors chosen - too small and the clustering may not converge. Experience so far is that 8 or 10 iterations is sufficient but sometimes a lower value makes interesting choices.
 
