import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var profit = 0
        for i in 0..<prices.count {
            let currentDayPrice = prices[i]
            guard let maxFuturePrice = prices[i..<prices.count].max() else { return profit }
            if (currentDayPrice < maxFuturePrice) {
                profit += maxFuturePrice - currentDayPrice
            }
        }
        return profit
    }
}
