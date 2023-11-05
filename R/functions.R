#' Perform a HTTP GET Request
#'
#' @param url A string containing a URL.
#'
#' @return If request is successful (i.e. the request was successfully performed
#'   and a response with HTTP status code <400 was recieved), an HTTP response;
#'   otherwise throws an error.
#'
#' @noRd
#'
#' @examples
#' get_request("https://cran.r-project.org/")
get_request <- function(url) {
  req <- httr2::request(url) |>
    httr2::req_perform()

  return(req)
}


#' Check That A Webpage Exists In The Wayback Machine
#'
#' @param url A string containing the URL to the webpage.
#' @param message Print friendly messages to the console? Default is `TRUE`.
#'
#' @return If request is successful (i.e. the request was successfully performed
#'   and a response with HTTP status code <400 was recieved), an HTTP response;
#'   otherwise throws an error.
#'
#' @export
#'
#' @examples
#' # Check that the CRAN homepage is in the Wayback Machine:
#' check_url("https://cran.r-project.org/")
check_url <- function(url, message = TRUE) {
  wayback_url <- paste0("http://archive.org/wayback/available?url=", url)

  req <- get_request(wayback_url)

  if(req$status == 200 & message == TRUE) {
    cli::cli_alert_success("This webpage has already been saved to the Wayback Machine.")
  }

  return(req)
}
