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

/// Given an array of integers, returns an array of the products of every
/// other element 

func allProductsExceptAtIndex(arr:[Int]) -> [Int] {
    if arr.isEmpty { return [0] }
    var products: [Int] = []
    var product = 1
    
    for num in arr {
        products.append(product)
        product = product * num
    }
    
    product = 1
    for index in (arr.count - 1).stride(through: 0, by: -1) {
       products[index] = products[index] * product
       product = product * arr[index]
    }
    
    return products
}
