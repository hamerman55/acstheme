#' Colorblind-friendly discrete color scale (Okabe & Ito)
#'
#' @param ... Arguments passed to scale_color_manual
#' @return A ggplot2 color scale
#' @export
scale_color_cb <- function(...) {
  cb_palette <- c(
    "#0072B2",  # blue
    "#D55E00",  # vermillion
    "#009E73",  # bluish green
    "#E69F00",  # orange
    "#CC79A7",  # reddish purple
    "#F0E442",  # yellow
    "#56B4E9",  # sky blue
    "#000000"   # black
  )
  ggplot2::scale_color_manual(values = cb_palette, ...)
}

#' Colorblind-friendly fill scale
#'
#' @param ... Arguments passed to scale_fill_manual
#' @return A ggplot2 fill scale
#' @export
scale_fill_cb <- function(...) {
  cb_palette <- c(
    "#0072B2",
    "#D55E00",
    "#009E73",
    "#E69F00",
    "#CC79A7",
    "#F0E442",
    "#56B4E9",
    "#000000"
  )
  ggplot2::scale_fill_manual(values = cb_palette, ...)
}
