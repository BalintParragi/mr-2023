#' Retrieve most recent BTC value in USD
#' @param attempt number from 1 to 5
#' @return num value of 1 BTC in USD
#' @examples
#' get_btcusdt()
#' @export
#' @importFrom binancer binance_coins_prices
#' @importFrom checkmate assert_number
#' @importFrom logger log_error
#' @import data.table

get_btcusdt <- function(attempt = 1){
  tryCatch({
    btcusdt <-  binance_coins_prices()[symbol == 'BTC', usd]
    assert_number(btcusdt,lower = 15000,upper = 100000)
  },error = function(e) {
    log_error(e$message)
    if(attempt > 5){
      stop("Give up")
    }
    Sys.sleep(1 + attempt^2)
    get_btcusdt(attempt = attempt + 1)
  })
  log_info('The current Bitcoin price is ${btcusdt}')
  btcusdt
}
