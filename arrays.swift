import Foundation


/// Given an array of Ints that represent stock market prices for a stock on a 
/// given day, return the highest possible profit from buying and selling on
//  that day.

func getMaxProfit(prices:[Int]) -> Int {
    var maxProfit = prices[1] - prices[0]
    var lowest = prices[0]
    
    for index in 1..<prices.count {
        let price = prices[index]
        let currentProfit = price - lowest
        maxProfit = maxProfit > currentProfit ? maxProfit : currentProfit
        lowest = lowest < price ? lowest : price
    }
    return maxProfit
}
