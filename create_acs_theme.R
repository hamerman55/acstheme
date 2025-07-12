# ===================================================
# SETUP: Create acstheme package structure and files
# ===================================================

# You can set your preferred path:
pkg_path <- "acstheme"
dir.create(pkg_path)
dir.create(file.path(pkg_path, "R"))

# --- DESCRIPTION file ---
writeLines(
  "Package: acstheme
Title: Publication-ready theme and color palette for ACS journals
Version: 0.1.0
Authors@R: person(\"Your\", \"Name\", email = \"your@email.com\", role = c(\"aut\", \"cre\"))
Description: Custom ggplot2 theme, colorblind-safe palette, and export function tailored for American Chemical Society journal figures.
Depends: R (>= 3.5.0)
Imports: ggplot2
License: MIT
Encoding: UTF-8
LazyData: true",
  con = file.path(pkg_path, "DESCRIPTION")
)

# --- NAMESPACE file ---
writeLines(
  "export(theme_acspub)
export(scale_color_cb)
export(scale_fill_cb)
export(save_acs_figure)",
  con = file.path(pkg_path, "NAMESPACE")
)

# --- theme_acspub.R ---
writeLines(
  "#' ACS publication-ready ggplot2 theme
#'
#' @param base_size Base font size
#' @param base_family Base font family
#' @return A ggplot2 theme object
#' @export
theme_acspub <- function(base_size = 12, base_family = \"\") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = \"bold\"),
      plot.subtitle = ggplot2::element_text(hjust = 0.5),
      axis.title = ggplot2::element_text(face = \"bold\"),
      axis.text = ggplot2::element_text(color = \"black\"),
      legend.position = \"right\",
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = \"gray80\", linewidth = 0.3)
    )
}",
  con = file.path(pkg_path, "R/theme_acspub.R")
)

# --- palette_cb.R ---
writeLines(
  "#' Colorblind-friendly discrete color scale (Okabe & Ito)
#'
#' @param ... Arguments passed to scale_color_manual
#' @return A ggplot2 color scale
#' @export
scale_color_cb <- function(...) {
  cb_palette <- c(
    \"#0072B2\", \"#D55E00\", \"#009E73\", \"#E69F00\",
    \"#CC79A7\", \"#F0E442\", \"#56B4E9\", \"#000000\"
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
    \"#0072B2\", \"#D55E00\", \"#009E73\", \"#E69F00\",
    \"#CC79A7\", \"#F0E442\", \"#56B4E9\", \"#000000\"
  )
  ggplot2::scale_fill_manual(values = cb_palette, ...)
}",
con = file.path(pkg_path, "R/palette_cb.R")
)

# --- save_acs_figure.R ---
writeLines(
  "#' Save figure with ACS publication defaults
#'
#' @param filename Output filename
#' @param plot Plot object (defaults to last plot)
#' @param width Width in inches (default 3.35 for single column)
#' @param height Height in inches (default 4.5)
#' @param dpi DPI resolution (default 300)
#' @param units Units for width and height (default \"in\")
#' @param ... Additional arguments to ggsave
#' @return Invisibly returns the filename
#' @export
save_acs_figure <- function(filename,
                            plot = ggplot2::last_plot(),
                            width = 3.35,
                            height = 4.5,
                            dpi = 300,
                            units = \"in\",
                            ...) {
  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    width = width,
    height = height,
    dpi = dpi,
    units = units,
    compression = \"lzw\",
    ...
  )
  invisible(filename)
}",
  con = file.path(pkg_path, "R/save_acs_figure.R")
)

cat("✅ Package skeleton 'acstheme' created at: ", normalizePath(pkg_path), "\n")
