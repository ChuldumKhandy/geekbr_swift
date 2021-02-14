//
//  main.swift
//  1l_ChuldumKhandy
//
//  Created by user on 09.02.2021.
//

import Foundation

// Решить квадратное уравнение.
let coefficientA: Float = 1, coefficientB: Float = 12, coefficientC: Float = 36
print("1. Решим квадратное уравнение \(coefficientA) * x² + \(coefficientB) * x + \(coefficientC) = 0.")
var x1: Float, x2: Float

let D = powf(coefficientB, 2) - 4 * coefficientA * coefficientC

if (D > 0) {
    x1 = (-(coefficientB) - sqrtf(D)) / 2 * coefficientA
    x2 = (-(coefficientB) + sqrtf(D)) / 2 * coefficientA
    print("Уравнение имеет два корня: х1 = \(x1) и х2 = \(x2)")
} else if (D == 0) {
    x1 = -(coefficientB) / 2 * coefficientA
    print("Уравнение имеет один корнь: х = \(x1)")
} else {
    print("Уравнение не имеет действительных корней")
}
    
//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("\n2. Катеты прямоугольного треугольника: а = 7, b = 5.")
let legA: Float = 7, legB: Float = 5

let S = (legA * legB / 2)
let hypotenuse = (roundf(sqrtf((powf(legA, 2)) + powf(legB, 2)) * 100) / 100)
let P = hypotenuse + legA + legB

print("Гипотенуза треугольника равна \(hypotenuse)\nПлощадь треугольника S = \(S)\nПериметр треугольника Р = \(P)")

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let deposit: Float = 100000, percentage: Float = 10, year = 5
var revenue: Float
print("\n3. Сумма вклада равна \(deposit), годовой процент - \(percentage).\n Сумма вклада")

for i in 1...year {
     revenue = deposit * powf((1 + 0.01 * percentage), Float(i))
     print("За \(i) год: \(revenue) денежных ед.")
 }
 

