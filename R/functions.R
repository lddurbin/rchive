check_url <- function(url) {
  slug <- "http://archive.org/wayback/available?url="

  req <- httr2::request(paste0(slug, url)) |>
    httr2::req_perform()

  return(req)
}
