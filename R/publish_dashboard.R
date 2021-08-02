#' Publish dashboard to gitea repo
#'
#' @return
#' TRUE if it worked
#' 
#' @param msg Message to add to the commit
#' 
#' @export
#' 
#' @import rmarkdown
#' @import git2r
#'
#' @examples
#' msg <- "Commit message" 
#' publish_dashboard(msg)
#' 
#' 


## Uses git2r package to add new files and commit them.
## It does not publish. You still need to push it to the repo! 
publish_dashboard <- function(msg) {
    stopifnot(nchar(msg) > 0)
    repo <- repository("resilience-dashboard/")
    # setwd("resilience-dashboard/") # not sure if this is going to work...
    add(repo, "src/resilience-dashboard.html")
    add(repo, "public/resilience-dashboard.html")
    commit(repo, msg)
    
}