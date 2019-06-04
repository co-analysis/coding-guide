
govtext <- function(text, colour, ...) {

  if (colour %in% names(govstyle::gov_cols)) {
    kbl_colour <- govstyle::gov_cols[colour]
  } else if (colour %in% grDevices::colours()) {
    kbl_colour <- paste0(c("rgb(", paste0(grDevices::col2rgb("wheat1"), collapse = ","), ")"), collapse = "")
  } else if (grepl("^#[A-Fa-f0-9]{6,8}$",colour)) {
    kbl_colour <- colour
  } else {
    stop("Colour supplied [", colour, "] is neither a govstyle::gov_cols colour,
         a standard R colour, or a valid HMTL hexadecimal colour")
  }

  kbl_text <- kableExtra::text_spec(x = text, color = kbl_colour, ...)

  return(kbl_text)

}
