import Foundation
import XCTest

// Given an array of Ints that represent stock market prices for a stock on a
// given day, return the highest possible profit from buying and selling on
//  that day.

func getMaxProfit(_ prices:[Int]) -> Int {
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

class MaxProfitTest: XCTestCase {
    func testGetMaxProfit() {
        XCTAssertEqual(getMaxProfit([10,7,5,8,11,9]), 6)
    }
}

// Given an array of integers, returns an array of the products of every
// other element

func allProductsExceptAtIndex(_ arr:[Int]) -> [Int] {
    if arr.isEmpty { return [0] }
    var products: [Int] = []
    var product = 1
    
    for num in arr {
        products.append(product)
        product = product * num
    }
    
    product = 1
    for index in stride(from: (arr.count - 1), through: 0, by: -1) {
       products[index] = products[index] * product
       product = product * arr[index]
    }
    
    return products
}

// Given an array of strings and an integer n, find the longest combined
// n consecutive strings. This is O(3n) time, which is the best I can think of
//  for now.

func longestConsecutiveStrings(_ arr:[String], _ num:Int) -> [String] {
    if arr.count < num { return [""] }
    
    var longestLengthSoFar = 0
    var startingIndexOfLongestLength = 0
    for idx in arr.indices {
        var currentLength = 0
        if arr.indices.contains(idx + (num - 1)) {
            currentLength = arr[idx...(idx + (num - 1))].reduce(0) { result, element in
                result + element.characters.count
            }
        }
        if currentLength > longestLengthSoFar {
            longestLengthSoFar = currentLength
            startingIndexOfLongestLength = idx
        }
    }
    return Array(arr[startingIndexOfLongestLength..<(startingIndexOfLongestLength + num)])
}

// Given an array of ints, return the largest possible product of three of
// them

func largestProductOfThree(_ arr:[Int]) -> Int {
    if arr.count < 3 { fatalError() }
    
    var highest = arr[0] > arr[1] ? arr[0] : arr[1]
    var lowest = arr[0] < arr[1] ? arr[0] : arr[1]
    var highestProductOfTwo = arr[0] * arr[1]
    var lowestProductOfTwo = highestProductOfTwo
    var highestProductOfThree = arr[0] * arr[1] * arr[2]
    
    for index in 2..<arr.endIndex {
        let current = arr[index]
        highestProductOfThree = [(highestProductOfTwo * current),
                                (lowestProductOfTwo * current),
                                highestProductOfThree].max()!
        
        highestProductOfTwo = [highestProductOfTwo, (highest * current), (lowest * current)].max()!
        lowestProductOfTwo = [lowestProductOfTwo, (highest * current), (lowest * current)].min()!
        
        highest = [highest, current].max()!
        lowest = [lowest, current].min()!
    }
    
    return highestProductOfThree
}

// Merge ranges... I'll write a more complete explanation soon.

func mergeRanges(_ ranges:[[Int]]) -> [[Int]] {
    let sortedRanges = ranges.sorted { $0[0] < $1[0] }
    var current = sortedRanges[0]
    var mergedRanges: [[Int]] = []
    
    for range in sortedRanges.dropFirst() {
        if current[1] >= range[0] {
            current = [current[0], range[1]]
            continue
        }
        mergedRanges.append(current)
        current = range
    }
    mergedRanges.append(current)
    return mergedRanges
}

class MergeRangesTest: XCTestCase {
    func testMergeRanges() {
        XCTAssertEqual(mergeRanges([[0,1], [3,5], [4,8], [10,12], [9,10]]), [[0,1], [3,8], [9,12]])
    }
}

// Find the unique Int in an array of otherwise duplicate Ints

func findUniqueInt(_ arr:[Int]) -> Int {
	var unique = 0
    arr.forEach() { unique = $0 ^ unique }
    return unique
}

class FindUniqueTest: XCTestCase {
    func testFindUnique() {
        XCTAssertEqual(findUniqueInt([2,2,3,3,4,4,2,2,3,5,4,4,3]), 5)
    }
}
