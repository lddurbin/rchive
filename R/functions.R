#' Check That Webpage Exists In Wayback Machine
#'
#' @param url A string containing the URL to the webpage.
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
check_url <- function(url) {
  slug <- "http://archive.org/wayback/available?url="

  req <- httr2::request(paste0(slug, url)) |>
    httr2::req_perform()

  return(req)
}
