library(testthat)
library(fars)
context("Functions for reading datafiles")


expect_error(fars_read("foo"), "file \'foo\' does not exist")
##expect_that(make_filename(2014), equals("/home/kwaku/repos/fars_0.0.0.9000.tar.gz"))
