test_that("get_request function returns expected results", {
  # Define a known URL for testing
  test_url <- "https://cran.r-project.org/"

  # Call the function
  result <- get_request(test_url)

  # Test that the request was successful (status code 200)
  expect_equal(result$status_code, 200)

  # Test that the result is a response object
  expect_s3_class(result, "httr2_response")
})


test_that("check_url function returns expected results", {
  # Define a known URL for testing
  test_url <- "https://cran.r-project.org/"

  # Call your function
  result <- check_url(test_url, message = FALSE)

  # Test that the request was successful (status code 200)
  expect_equal(result$status_code, 200)

  # Test that the result is a response object
  expect_s3_class(result, "httr2_response")

  # Optionally, test for the success message if you want to ensure that the cli alert is triggered
  expect_message(check_url(test_url), "This webpage has already been saved to the Wayback Machine.")
})
