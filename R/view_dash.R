#' View dashboard from repo
#'
#' @return
#' TRUE if it worked
#' @export
#'
#' @examples
#' view_dash()
#' 
#' 



view_dash <- function() {
    viewer <- getOption("viewer")
    browseURL("resilience-dashboard/public/resilience-dashboard.html")
}