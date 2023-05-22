#' Retrieve USD/EUR exchange rate using API
#' @return numeric value of 1 USD in EUR
#' @examples
#' get_usdeur()
#' @export
#' @importFrom jsonlite fromJSON
#' @importFrom checkmate assert_number
#' @import logger

get_usdeur <- function(){
  tryCatch({
    usdeur <- fromJSON('https://api.exchangerate.host/latest?base=USD&symbols=EUR')$rates$EUR
    assert_number(usdeur,lower = 0.1,upper = 2)
  },error = function(e) {
    log_error(e$message)
    Sys.sleep(1)
    get_usdeur()
  })
  log_info('1 USD currently costs {usdeur} EUR')
  usdeur
}
