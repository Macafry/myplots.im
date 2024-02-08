#' Create a quick scatter plot in ggplot.
#'
#' This will graph a given vectors in a ggplot-style box plot with the
#' x-axis labeled "cat" if given a category vector and the y-axis labeled "x"
#' or vice versa if a horizontal box plot was selected.
#'
#' @param x This is the vector containing values to be plotted.
#' @param cat This is the vector containing the category for each value.
#' The default is NA: all of them belong to the same category.
#' @param vertical This is the orientation of the box plot. TRUE for vertical FALSE for horizontal.
#' @param point_size This is the size of the points that will be plotted.
#' The default is size TRUE: a vertical box plot.
#'
#' @return This function returns a ggplot box plot plot object.
#'
#' @examples
#' ## Create a vertical box plot of x.
#' x <- rnorm(100)
#' gbox(x)
#'
#' ## Create a horizontal box plot of x by cat.
#' x <- rnorm(100)
#' cat <- sample(c("A","B"),100, replace = T)
#' gbox(x, cat, vertical = FALSE)
#'
#' @import
#'   ggplot2
#'   magrittr
#'
#' @export

gbox <- function(x, cat=NULL, vertical = TRUE) {
  if(!is.vector(cat) && !is.factor(cat)) {
    p <- data.frame(x) %>%
      ggplot(aes(y=x)) +
      geom_boxplot(fill="lightblue")
  } else {
    cat %<>% as.factor
    p <- data.frame(x, cat) %>%
      ggplot(aes(y = x, x = cat, fill = cat)) +
      geom_boxplot()
  }

  if(!vertical) {
    p = p + coord_flip()
  }

  p
}
