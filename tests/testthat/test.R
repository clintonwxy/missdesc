library(missdesc)
context("Check correct values")

test_that("Output has correct values", {
  expect_equal(capture.output(summarymissing(testdf))[2], "  Dimensions:                   4 3 ")
  expect_equal(capture.output(summarymissing(testdf))[3], "  Percentage complete:          83.33% ")
  expect_equal(capture.output(summarymissing(testdf))[4], "  Percentage missing:           16.67% ")
  expect_equal(capture.output(summarymissing(testdf))[5], "  Percentage complete columns:  33.33% ")
  expect_equal(capture.output(summarymissing(testdf))[6], "  Percentage complete rows:     50% ")
  expect_equal(capture.output(summarymissing(testdf))[9], "  1 | Age ")
  expect_equal(capture.output(summarymissing(testdf))[10], "  3 | Happiness ")
})
