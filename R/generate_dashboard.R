#' Generates dashboard from RMarkdown file saves it to repo
#'

#' @return
#' TRUE if it worked
#' @export
#'
#' 
#' @import rmarkdown
#' @import here
#' 
#' @examples
#' generate_dashboard()
#' 
#' 


generate_dashboard <- function() {
    ## check the directory exists
    dshfl <- "E:/project_folders/apps/db/dashboard/dash_rec2.Rmd"
    if(!file.exists(dshfl)) {stop("Rmarkdown file doesn't exist")}
    if(!dir.exists("resilience-dashboard")) {stop("Repo directory doesn't exist")}
    gtsrc <- here("resilience-dashboard/src/resilience-dashboard.html")
    gtpub <- here("resilience-dashboard/public/resilience-dashboard.html")
    render(input = dshfl,  output_file = gtsrc)
    file.copy(gtsrc, gtpub, overwrite = TRUE)
    TRUE
}