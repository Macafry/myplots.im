#' Create a quick histogram plot in ggplot.
#'
#' This will graph a given vector in a ggplot-style histogram plot with the
#' x-axis labeled "x" and the y-axis labeled "count".
#'
#' @param x This is the vector to be plotted.
#' @param border_color This is the color of the bins' outline
#' @param fill_color This is the color of the bins
#' @param bins This is the number of bins for the histogram.
#' The default is 10 bins.
#'
#' @return This function returns a ggplot histogram object.
#'
#' @examples
#' ## Create a histogram plot of x.
#' x <- rnorm(100)
#' ghist(x)
#'
#' @import
#'   ggplot2
#'   magrittr
#'
#' @export

ghist <- function(x, border_color = "black", fill_color = "lightblue", bins = 10) {
  data.frame(x) %>%
    ggplot(aes(x = x)) +
    geom_histogram(color = border_color,
                   fill = fill_color,
                   bins = bins)
}
