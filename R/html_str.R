#' @title htmlwidget for flextable
#'
#' @description htmlwidget for flextable. This function is deprecated.
#'
#' @param x \code{flextable} object
#' @param ... Unused arguments
#'
#' @export
tabwid <- function(x, ...) {

  .Deprecated(msg = "tabwid is no more required as flextable objects have their own knit_print method now.")
  knit_print(x)
}

html_str <- function( x ){
  UseMethod("html_str")
}


html_str.regulartable <- function( x ){

  dims <- dim(x)

  out <- "<table>"
  if( !is.null(x$header) ){
    tmp <- format(x$header, type = "html", header = TRUE)
    out = paste0(out, "<thead>", tmp, "</thead>" )
  }
  if( !is.null(x$body) ){
    tmp <- format(x$body, type = "html", header = FALSE)
    out = paste0(out, "<tbody>", tmp, "</tbody>" )
  }

  out = paste0(out,  "</table>" )
  out
}
html_str.complextable <- html_str.regulartable
