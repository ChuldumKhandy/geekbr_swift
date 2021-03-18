//
//  main.swift
//  7l_ChuldumKhandy
//
//  Created by user on 17.03.2021.
//

import Foundation

/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let
 */

enum PurchaseError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

struct Item {
    var price: Int
    var count: Int
}

class ClothingStore {
    var inventory = [
        "Футболка": Item(price: 2000, count: 5),
        "Рубашка": Item(price: 3000, count: 3),
        "Брюки": Item(price: 5000, count: 2)
    ]
    var coinsDeposit = 10000
    
    func sell(product: String) -> (String?, PurchaseError?) {
        guard let item = inventory[product] else {
            return (nil, PurchaseError.invalidSelection)
        }
        guard item.count > 0 else {
            return (nil, PurchaseError.outOfStock)
        }
        guard item.price <= coinsDeposit else {
            return (nil, PurchaseError.insufficientFunds(coinsNeeded: item.price - coinsDeposit))
        }

        coinsDeposit -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[product] = newItem
        //print("Вам продали: \(product)")
        return (product, nil)
    }
}

let store = ClothingStore()
let customer1 = store.sell(product: "Футболка")
let customer2 = store.sell(product: "Платье")
let customer3 = store.sell(product: "Брюки")
 
if let product = customer1.0 {
    print("Мы купили: \(product)")
} else if let error = customer1.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}


/*
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

enum cookingError: Error {
    case invalidSelection
    case invalidTime
    case invalidTemperature
}

struct elementsForCooking {
    var amontOfIngredients: Int
    var temperature: Int
    var times: Int
}

class Cookbook {
    var recipe = [
        "Brownies": elementsForCooking(amontOfIngredients: 13, temperature: 175, times: 25),
        "Red Velvet Cake": elementsForCooking(amontOfIngredients: 20, temperature: 175, times: 20),
        "Apple Pie": elementsForCooking(amontOfIngredients: 8, temperature: 220, times: 40)
    ]
    
    func cook(food: String, cookingTemperature: Int, cookingTime: Int) throws {
        guard let item = recipe[food] else {
            throw cookingError.invalidSelection
        }
        guard item.temperature == cookingTemperature else {
            throw cookingError.invalidTemperature
        }
        guard item.times == cookingTime else {
            throw cookingError.invalidTime
        }
        print("Мы приготовили: \(food)")
    }
}

let recipe = Cookbook()
do {
    let recipe1 = try recipe.cook(food: "Cookies", cookingTemperature: 220, cookingTime: 20)
} catch cookingError.invalidSelection {
    print("Данного рецепта в поваренной книге нет")
} catch cookingError.invalidTemperature {
    print("Не верно выставлена температура")
} catch cookingError.invalidTime {
    print("Не верно выставлено время")
} catch let error {
    print(error.localizedDescription)
}
