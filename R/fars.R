library(dplyr)

##' Read CSV files into a tibble.  Using \code{\link[dplyr]{tbl_df}}
##' read a file supported by that function.
##' @title FARS Read Funcion
##' @param filename String contianing the name and relative path to a
##'     file.
##' @return A "tbl_df" tibble object.
##' @export

fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

##' FARS make_filename
##' 
##' From the year, creates a valid file name to work with FARS
##' dataset.
##' @param year A string or integer representation of a year.
##' @return A string matching a valid file name for the dataset, e.g.,
##'     for 2015, \code{make_filename(2015)} will return
##'     "./data/accident_2015.csv.bz2"
##' @export
##' @examples
##' make_filename(2014)
##' make_filename("2015")
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("./data/accident_%d.csv.bz2", year)

}

