test_that("wbfun converts wide data to long format", {

  # Create an example dataset
  example_data <- data.frame(
    iso = "CAN",
    matrix(
      1:20,
      nrow = 1,
      dimnames = list(NULL, paste0("X", 2000:2019))
    )
  )

  # Apply the function
  result <- wbfun(example_data, "mortality")

  # Check the results
  expect_equal(nrow(result), 20)
  expect_equal(names(result), c("iso", "year", "mortality"))
  expect_equal(result$year, 2000:2019)
  expect_equal(result$mortality, 1:20)

})
