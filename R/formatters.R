#' Format a number with the EUR symbol
#' @param x number
#' @return string with the EUR symbol as prefix
#' @examples
#' euro(42)
#' euro(4.2*1e7)
#' @export
#' @importFrom scales dollar

euro <- function(x){
  if(is.numeric(x)){
    return(dollar(x,prefix = "€"))
  } else {
    return(NA)
  }

}
