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
