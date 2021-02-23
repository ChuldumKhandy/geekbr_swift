//
//  main.swift
//  3l_ChuldumKhandy
//
//  Created by user on 23.02.2021.
//

import Foundation

//Легковой автомобиль
enum EngineState: String {
    case start = "Включен"
    case turnOff = "Выключен"
}
enum WindowState: String {
    case open = "Открыты"
    case close = "Закрыты"
}
enum TrunkState: String {
    case empty = "Пуст"
    case store = "Что-то хранит"
    case full = "Полон"
}
func printCar (currentCar: SportCar){
    print("Машина: \(currentCar.brand) Год выпуска: \(currentCar.yearOfIssue) Объем багажника \(currentCar.trunkVolume)\nДвигатель: \(currentCar.engine.rawValue)\nОкна: \(currentCar.windows.rawValue)\nБагажник: \(currentCar.trunkIsFull.rawValue), текущий объем багажника \(currentCar.currentVolume)")
}
struct SportCar {
    let brand: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var engine: EngineState
    var windows: WindowState
    var trunkIsFull: TrunkState
    var currentVolume: Double
    
    mutating func startEngine () {
        engine = .start
    }
    mutating func turnOffEngine () {
        engine = .turnOff
    }
    mutating func openWindow () {
        windows = .open
    }
    mutating func closeWindow () {
        windows = .close
    }
    mutating func loadCargo(volume: Double) {
        print("\nПогрузим груз объемом: \(volume)")
        switch trunkIsFull {
        case .empty:
            if (volume >= trunkVolume) {
                trunkIsFull = .full
                currentVolume = 0
            } else {
                currentVolume = trunkVolume - volume
                trunkIsFull = .store
            }
        case .store:
            if ((currentVolume - volume) <= 0) {
                trunkIsFull = .full
                currentVolume = 0
            } else {
                currentVolume -= volume
                trunkIsFull = .store
            }
        default:
            print("Багажник полон")
        }
    }
    mutating func uploadCargo(volume: Double) {
        print("\nВыгрузим груз объемом: \(volume)")
        switch trunkIsFull {
        case .full:
            if (volume >= trunkVolume) {
                trunkIsFull = .empty
                currentVolume = trunkVolume
            } else {
                currentVolume = volume
                trunkIsFull = .store
            }
        case .store:
            if ((currentVolume - volume) <= 0) {
                trunkIsFull = .empty
                currentVolume = trunkVolume
            } else {
                currentVolume -= volume
                trunkIsFull = .store
            }
        default:
            print("Багажник пуст")
        }
    }
}
//Грузовой автомобиль
enum EngineType: String {
    case gasoline = "Бензиновый"
    case diesel = "Дизельный"
    case gas = "Газовый"
    case combination = "Комбинированный"
    case hybrid = "Гибридный"
}
enum BodyStructure: String {
    case onboard = "Бортовой"
    case platform = "Платформа"
}
enum DoorsState: String {
    case open = "Открыты"
    case close = "Закрыты"
}
func printTrunkCar (currentCar: TrunkCar){
    print("Грузовой автомобиль: \(currentCar.brand) Год выпуска: \(currentCar.yearOfIssue) Масса груза, который можно перевозить в кузове: \(currentCar.bodyVolume)\nДвери: \(currentCar.doors.rawValue)\nТип двигателя: \(currentCar.engine.rawValue)\nТип багажника: \(currentCar.bodyOfCar.rawValue)")
}
struct TrunkCar {
    let brand: String
    let yearOfIssue: Int
    let bodyVolume: Double
    var doors: DoorsState
    var engine: EngineType
    var bodyOfCar: BodyStructure
    
    func identifyTruck(){
        switch bodyVolume {
        case 0..<1:
            print("Особо малый грузовой автомобиль, для перевозки небольших партий грузов, обычно в пределах города")
        case 1..<3:
            print("Малый грузовой автомобиль, для перевозки товаров в торговой сети ")
        case 3..<5:
            print("Средний грузовой автомобиль, для перевозки массовых грузов промышленных предприятий, строительных материалов и сельскохозяйственных грузов")
        case 5..<8:
            print("бБольшой грузовой автомобиль, для массовых перевозок по дорогам с твердым покрытием")
        default:
            print("Особо большой грузовой автомобиль, для перевозки руды, угля, вывозки породы, работы на крупных стройках и т.д.")
        }
    }
    mutating func openDoors () {
        doors = .open
    }
    mutating func closeDoors () {
        doors = .close
    }
}

var skodaCar = SportCar(brand: "Skoda", yearOfIssue: 2014, trunkVolume: 530, engine: .turnOff, windows: .close, trunkIsFull: .full, currentVolume: 0)
printCar(currentCar: skodaCar)
var n: Double = 500
skodaCar.uploadCargo(volume: n)
skodaCar.startEngine()
printCar(currentCar: skodaCar)

var volkswagenCar = SportCar(brand: "Volkswagen", yearOfIssue: 2000, trunkVolume: 400, engine: .turnOff, windows: .close, trunkIsFull: .empty, currentVolume: 400)
n = 300
volkswagenCar.loadCargo(volume: n)
volkswagenCar.openWindow()
volkswagenCar.startEngine()
printCar(currentCar: volkswagenCar)

var manTrunk = TrunkCar(brand: "MAN", yearOfIssue: 2020, bodyVolume: 4, doors: .close, engine: .diesel, bodyOfCar: .platform)
manTrunk.openDoors()
printTrunkCar(currentCar: manTrunk)
manTrunk.identifyTruck()

var volvoTrunk = TrunkCar(brand: "Volvo", yearOfIssue: 1995, bodyVolume: 9, doors: .open, engine: .gasoline, bodyOfCar: .onboard)
volvoTrunk.closeDoors()
printTrunkCar(currentCar: volvoTrunk)
