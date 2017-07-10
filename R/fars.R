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


##' Create a list of year tibbles.
##'
##' For each year passed into the function, create an tibble in a list
##' that contains just the years and months from the dataset for those
##' years.
##' @title FARS Read Years
##' @param years Vector of either intigers or strings correspondig to
##'     years for which the data set is available.
##' @import dplyr
##' @return A list of FARS tibbles.
##' @examples
##' fars_read_years(c("2014", 2015))
fars_read_years <- function(years) {
    lapply(years, function(year) {
        file <- make_filename(year)
        tryCatch({
            dat <- fars_read(file)
            dplyr::mutate(dat, year = year) %>% 
                dplyr::select(MONTH, year)
        }, error = function(e) {
            warning("invalid year: ", year)
            return(NULL)
        })
    })
}
