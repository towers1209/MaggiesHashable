//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/// Splits a collection into sets, grouped by the result of running each value through a callback.
///
/// :param The array to group
/// :param callback Function whose response will be used as a key in the new string
public func groupBy<T, U: Hashable>(array: [T], callback: (T) -> U) -> [U: [T]] {
  var grouped = [U: [T]]()
  for element in array {
    let key = callback(element)
    if var arr = grouped[key] {
      arr.append(element)
      grouped[key] = arr
    } else {
      grouped[key] = [element]
    }
  }
  return grouped
}


print (groupBy([1, 2, 3, 4, 5], callback: {$0 % 1}))
//Console Output: [0: [1, 2, 3, 4, 5]]

print (groupBy([1, 2, 3, 4, 5], callback: {$0 % 2}))
//Console Output: [0: [2, 4], 1: [1, 3, 5]]

print (groupBy([1, 2, 3, 4, 5], callback: {$0 % 3}))
//Console Output: [2: [2, 5], 0: [3], 1: [1, 4]]

print (groupBy([1, 2, 3, 4, 5], callback: {$0 % 4}))
//Console Output: [2: [2], 3: [3], 1: [1, 5], 0: [4]]


