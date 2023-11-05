test_that("check_url function returns expected results", {
  # Define a known URL for testing
  test_url <- "http://www.example.com"

  # Call the function
  result <- check_url(test_url)

  # Test that the request was successful (status code 200)
  expect_equal(result$status_code, 200)

  # Test that the result is a response object
  expect_s3_class(result, "httr2_response")
})
