import Foundation

func quicksort<T: Comparable>(var list: [T]) -> [T] {
	guard let pivot = list.first else {
		return []
	}
	list.removeAtIndex(0)

	if list.count == 0 {
		return []
	} else {
		let smaller = list.filter { $0 < pivot }
		let bigger = list.filter { $0 >= pivot }
		return (quicksort(smaller) + [pivot] + quicksort(bigger))
	}
}
