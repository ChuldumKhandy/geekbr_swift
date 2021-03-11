//
//  main.swift
//  6l_ChuldumKhandy
//
//  Created by user on 10.03.2021.
//

import Foundation

struct queue <T : Comparable> {
    private var elements: [T] = []

    mutating func push (_ value: T) {
      elements.append(value)
    }

    mutating func pop () -> T? {
      guard !elements.isEmpty else {
        return nil
      }
      return elements.removeFirst()
    }
    
    func countQueue () -> Int {
        return elements.count
    }
    
    mutating func sortQueue () -> [T] {
        elements.sort()
        return elements
    }
    
    subscript (index: Int) -> T? {
        if index < elements.count {
            return elements[index]
        } else {
            return nil
        }
    }
}

var purchases = queue<String>()
purchases.push("Молоко")
purchases.push("Хлеб")
purchases.push("Масло")
purchases.push("Сок")
print("Количество продуктов, которые нужно купить: \(purchases.countQueue())")
print("На четвертом месте покупок у нас: \(purchases[3])")
purchases.pop()
print("На четвертом месте покупок у нас: \(purchases[3])")
purchases.sortQueue()
print(purchases)






