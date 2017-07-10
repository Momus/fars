library(dplyr)

##' Read CSV files into a tibble.  Using \code{\link[dplyr]{tbl_df}}
##' read a file supported by that function.
##' @title FARS Read Funcion
##' @param filename String contianing the name and relative path to a
##'     file.
##' @return A "tbl_df" tibble object.
##' @export
##' @examples
##' \code{\dontrun{data2015 <- fars_read("./data/accident_2015.csv.bz2")}}
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

#' From the year, create a valid file name.
#'
#' @description Using \code{\link[dplyr]{tbl_df}} read a file supported by that
#' function.
#' 
#' @param year A string or integer representation of a year.
#'     
#' @return A string matching a valid file name for the dataset.
#' 
#' Errors: Anything that can't be coerced by as.integer will
#' generate a warning, and the same file:
#' \code{\dontrun{
#        'zz <- make_filename("zz")
#'        Warning message:
#'        In make_filename("zz") : NAs introduced by coercion
#'       > zz
#'       [1] "accident_NA.csv.bz2"
#' }}
#'
#' @export
#' @examples
#' \code{make_filename(2015)}
#' 
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("./data/accident_%d.csv.bz2", year)

}



