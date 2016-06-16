import Foundation

// Commented out while I figure out how Swift 3 broke this.

//func quicksort<T: Comparable>(_ list: [T]) -> [T] {
//	var list = list
//	guard let pivot = list.first else {
//		return []
//	}
//	list.remove(at: 0)
//
//	if list.count == 0 {
//		return []
//	} else {
//		let smaller = list.filter { $0 < pivot }
//		let bigger = list.filter { $0 >= pivot }
//		return (quicksort(smaller) + [pivot] + quicksort(bigger))
//	}
//}

