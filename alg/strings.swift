import Foundation
import XCTest

// Determines whether a string is a palindrome or not. Case sensitive.

func isPalindrome(_ str:String) -> Bool {
	for i in 0...(str.characters.count / 2) {
		if str[str.characters.index(str.startIndex, offsetBy: i)] == str[str.characters.index(str.endIndex, offsetBy: (-1 - i))] {
			continue
		} else {
			return false
		}
	}
	return true
}


// Determines whether a string can be rearranged to become a palindrome.

func anagramPalindrome(_ str:String) -> Bool {
	var chars = [Character:Int]()
	for i in 0..<(str.characters.count) {
		let c = str[str.characters.index(str.startIndex, offsetBy: i)]
		if let _ = chars[c] {
			chars[c] = chars[c]! + 1
		} else {
			chars[c] = 1
		}
	}

	if (chars.filter { $0.1 % 2 == 0 }).count <= 1 {
		return false
	}
	return true
}


// Determines whether a string has all unique characters.

func allUniqueCharacters(_ str:String) -> Bool {
    var characters = [Character:Bool]()
    for char in str.characters {
        if let _ = characters[char] {
            return false
        } else {
            characters[char] = true
        }
    }
    return true
}


// Determine the first unique character in a string. O(n)

func firstUniqueCharacter(_ str:String) -> Character? {
    var chars = [Character:Int]()
    
    for char in str.characters {
        if case .some = chars[char] {
            chars[char]! += 1
        } else {
            chars[char] = 1
        }
    }
    
    for char in str.characters {
        if let n = chars[char] where n == 1 {
            return char
        }
    }
    return nil
}


// Remove characters from a given string. O(n).

func remove(_ characters:String, from:String) -> String {
    let chars = Array(characters.characters)
    var newString = ""
    
    for char in from.characters {
        if chars.contains(char) {
            continue
        } else {
            newString.append(char)
        }
    }
    return newString
}


// Replace spaces in a string with %20. O(n).

func urlify(_ str:String) -> String {
    let space: Character = " "
    var newString: String = ""
    for char in str.characters {
        if char == space {
            newString.append(Character("%"))
            newString.append(Character("2"))
            newString.append(Character("0"))
        } else {
            newString.append(char)
        }
    }
    return newString
}


// Check is a string is exactly one change away from another. O(n).

func oneChangeAway(_ original:String, new:String) -> Bool {
    
    func checkReplacement() -> Bool {
        var changeFound = false
        for index in 0..<original.characters.count {
            switch original[original.characters.index(original.startIndex, offsetBy: index)] {
            case new[new.characters.index(new.startIndex, offsetBy: index)]:
                continue
            case _ where changeFound == false:
                changeFound = true
                continue
            default:
                return false
            }
        }
        return true
    }
    
    func checkRemoval() -> Bool {
        let originalSet = Set(original.characters)
        let newSet = Set(new.characters)
        return newSet.isStrictSubset(of: originalSet)
    }
    
    func checkAddition() -> Bool {
        let originalSet = Set(original.characters)
        let newSet = Set(new.characters)
        return newSet.isStrictSuperset(of: originalSet)
    }
    
    if original == new { return true }
    
    if original.characters.count == new.characters.count { return checkReplacement() }
    if original.characters.count == new.characters.count + 1 { return checkRemoval() }
    if original.characters.count == new.characters.count - 1 { return checkAddition() }
    
    return false
}

// Compress a string into character counts. Given "aaabbbccc", returns
// "a3b3c3".

func compressString(_ str:String) -> String {
    if str.isEmpty { return str }
    
    var compressedString = ""
    var index = str.characters.index(str.startIndex, offsetBy: 1)
    var previousChar = str[str.startIndex]
    var currentCount = 1
    
    for char in str.substring(from: str.characters.index(str.startIndex, offsetBy: 1)).characters {
        index = str.characters.index(index, offsetBy: 1)
        if previousChar == char && index == str.endIndex {
            currentCount += 1
            compressedString.append(char)
            compressedString.append(String(currentCount))
            continue
        }
        
        if index == str.endIndex {
            compressedString.append(char)
        }
        
        if previousChar == char {
            currentCount += 1
            continue
        }
        
        compressedString.append(previousChar)
        if currentCount > 1 {
            compressedString.append(String(currentCount))
        }
        previousChar = char
        currentCount = 1
        
    }
    if str.characters.count <= compressedString.characters.count {
        return str
    }
    return compressedString
}

// Check to see of one string is a rotation of another

func checkForRotation(_ string1: String, _ string2: String) -> Bool {
    if string1.characters.count != string2.characters.count { return false }
    var s1 = string1
    s1.append(string1)
    return s1.contains(string2)
}

class CheckForRotationTest: XCTestCase {
    func testRotation() {
        XCTAssertTrue(checkForRotation("BenjaminSisko", "jaminSiskoBen"))
        XCTAssertFalse(checkForRotation("nope", "not even close"))
    }
}
