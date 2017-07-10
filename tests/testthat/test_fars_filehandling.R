library(testthat)
library(fars)
context("Functions for reading datafiles")


expect_error(
    fars_read("foo"),
    "file \'foo\' does not exist")

## There should be some datafiles for everything to work
expect_true(
    file.exists(file.path(system.file(
        "data", package="fars"), "accident_2014.csv.bz2")))

expect_true(
    file.exists(file.path(system.file(
        "data", package="fars"), "accident_2015.csv.bz2")))
                                  
## Datafiles read in correctly
fars_2015 <- fars_read(file.path(system.file(
    "data", package="fars"), "accident_2015.csv.bz2"))


expect_equal(
    length(fars_2015),
    52)


##expect_that(make_filename(2014), equals("/home/kwaku/repos/fars_0.0.0.9000.tar.gz"))
