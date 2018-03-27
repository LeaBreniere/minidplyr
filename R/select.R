#' Select variables
#'
#' This function allows to select variables from a data frame
#'
#' @param x A data frame. 
#' @param vars Either
#' - a character vector of variable names
#' - an integer vector of variables positions
#'- a boolean vector of variables to keep
#'
#' @return A data frame constituted by all the rows of `x` and only the columns specified in `vars`.
#' @export
#'
#' @examples
#' select2(iris, c("Petal.Width", "Species"))
#' select2(iris, c(4, 5))
#' select2(iris, c(FALSE, FALSE, FALSE, TRUE, TRUE))
select2 <- function(x, vars) {
  x[vars]
}