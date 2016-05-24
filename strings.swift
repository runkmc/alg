import Foundation

// Determines whether a string is a palindrome or not. Case sensitive.

func isPalindrome(str:String) -> Bool {
	for i in 0...(str.characters.count / 2) {
		if str[str.startIndex.advancedBy(i)] == str[str.endIndex.advancedBy((-1 - i))] {
			continue
		} else {
			return false
		}
	}
	return true
}


// Determines whether a string can be rearranged to become a palindrome.

func anagramPalindrome(str:String) -> Bool {
	var chars = [Character:Int]()
	for i in 0..<(str.characters.count) {
		let c = str[str.startIndex.advancedBy(i)]
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

func allUniqueCharacters(str:String) -> Bool {
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

func firstUniqueCharacter(str:String) -> Character? {
    var chars = [Character:Int]()
    
    for char in str.characters {
        if case .Some = chars[char] {
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
