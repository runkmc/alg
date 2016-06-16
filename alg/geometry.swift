import Foundation
import XCTest

struct Rectangle {
    let xPosition: Int
    let xLength: Int
    let yPosition: Int
    let yLength: Int
}

extension Rectangle: Equatable {}

func ==(lhs:Rectangle, rhs:Rectangle) -> Bool {
    return lhs.xLength == rhs.xLength &&
        lhs.xPosition == rhs.xPosition &&
        lhs.yLength == rhs.yLength &&
        lhs.yPosition == rhs.yPosition
}

// Find the intersecting rectangle between two rectangles

func findRectangularOverlap(_ rect1:Rectangle, _ rect2:Rectangle) -> Rectangle? {
    func findLinearOverlap(_ start1:Int, _ length1:Int, _ start2:Int, _ length2:Int) -> (startOverlap: Int, endOverlap: Int)? {
        let highestStartPoint = [start1, start2].max()!
        let lowestEndPoint = [start1 + length1, start2 + length2].min()!
        
        if highestStartPoint >= lowestEndPoint { return nil }
        return (startOverlap: highestStartPoint, endOverlap:lowestEndPoint)
    }
    
    let xOverlap = findLinearOverlap(rect1.xPosition, rect1.xLength, rect2.xPosition, rect2.xLength)
    let yOverlap = findLinearOverlap(rect1.yPosition, rect1.yLength, rect2.yPosition, rect2.yLength)
    
    guard let x = xOverlap, y = yOverlap else { return nil }
    
    return Rectangle(xPosition: x.startOverlap, xLength: x.endOverlap - x.startOverlap, yPosition: y.startOverlap, yLength: y.endOverlap - y.startOverlap)
}

class FindRectangularOverlapTest: XCTestCase {
    let rect1 = Rectangle(xPosition: 1, xLength: 2, yPosition: 1, yLength: 2)
    let rect2 = Rectangle(xPosition: 2, xLength: 2, yPosition: 2, yLength: 2)
    func testOverlap() {
        XCTAssertEqual(findRectangularOverlap(rect1, rect2), Rectangle(xPosition: 2, xLength: 1, yPosition: 2, yLength: 1))
    }
}
