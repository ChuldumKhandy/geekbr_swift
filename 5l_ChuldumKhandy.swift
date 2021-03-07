//
//  main.swift
//  5l_ChuldumKhandy
//
//  Created by user on 04.03.2021.
//

enum EngineState: String {
    case start = "Включен"
    case turnOff = "Выключен"
}
enum WindowsState: String {
    case open = "Открыты"
    case close = "Закрыты"
}
enum TrunkState: String {
    case empty = "Пуст"
    case store = "Что-то хранит"
    case full = "Полон"
}

protocol Car {
    var brand: String { get }
    var yearOfIssue: Int { get }
    var trunkVolume: Double { get }
    var engine: EngineState { get set }
    var windows: WindowsState { get set }
    var trunkIsFull: TrunkState { get set }
    var currentVolume: Double { get set }
}

extension Car {
    mutating func changeEngineState(state: EngineState) {
        engine = state
    }
    mutating func changeWindowsState(state: WindowsState) {
        windows = state
    }
}

class SportCar: Car {
    var brand: String
    var yearOfIssue: Int
    var trunkVolume: Double
    var engine: EngineState
    var windows: WindowsState
    var trunkIsFull: TrunkState
    var currentVolume: Double
    var body: BodyType
    var drive: DriveType
    
    enum BodyType: String {
        case sedan = "Седан"
        case hatchback = "Хэтчбек"
        case limousine = "Лимузин"
        case cabriolet = "Кабриолет"
    }
    enum DriveType: String {
        case rear = "Задний привод"
        case frontWheel = "Передний привод"
        case fourWheel = "Полный привод"
    }
    
    init(brand: String, yearOfIssue: Int, trunkVolume: Double, engine: EngineState, windows: WindowsState, trunkIsFull: TrunkState, currentVolume: Double, body: BodyType, drive: DriveType) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkIsFull = trunkIsFull
        switch trunkIsFull {
        case .empty:
            self.currentVolume = trunkVolume
        case .full:
            self.currentVolume = 0
        default:
            self.currentVolume = currentVolume
        }
        self.body = body
        self.drive = drive
    }
    func changeBody(state: BodyType) {
        self.body = state
    }
    func changeDrive(state: DriveType) {
        self.drive = state
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\nМашина бренда: \(brand) \nГод выпуска: \(yearOfIssue) \nОбъем багажника \(trunkVolume)\nДвигатель: \(engine.rawValue)\nОкна: \(windows.rawValue)\nБагажник: \(trunkIsFull.rawValue), текущий объем багажника \(currentVolume) \nТип кузова: \(body.rawValue) \nПривод: \(drive.rawValue)"
    }
}

class TrunkCar: Car {
    var brand: String
    var yearOfIssue: Int
    var trunkVolume: Double
    var engine: EngineState
    var windows: WindowsState
    var trunkIsFull: TrunkState
    var currentVolume: Double
    var bodyTrunk: BodyStructure
     
    enum BodyStructure: String {
        case onboard = "Бортовой"
        case platform = "Платформа"
    }
    
    init(brand: String, yearOfIssue: Int, trunkVolume: Double, engine: EngineState, windows: WindowsState, trunkIsFull: TrunkState, currentVolume: Double, bodyTrunk: BodyStructure) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkIsFull = trunkIsFull
        switch trunkIsFull {
        case .empty:
            self.currentVolume = trunkVolume
        case .full:
            self.currentVolume = 0
        default:
            self.currentVolume = currentVolume
        }
        self.bodyTrunk = bodyTrunk
    }
    
    func identifyTruck(){
        switch trunkVolume {
        case 0..<1000:
            print("Особо малый грузовой автомобиль, для перевозки небольших партий грузов, обычно в пределах города")
        case 1000..<3000:
            print("Малый грузовой автомобиль, для перевозки товаров в торговой сети ")
        case 3000..<5000:
            print("Средний грузовой автомобиль, для перевозки массовых грузов промышленных предприятий, строительных материалов и сельскохозяйственных грузов")
        case 5000..<8000:
            print("Большой грузовой автомобиль, для массовых перевозок по дорогам с твердым покрытием")
        default:
            print("Особо большой грузовой автомобиль, для перевозки руды, угля, вывозки породы, работы на крупных стройках и т.д.")
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\nМашина бренда: \(brand) \nГод выпуска: \(yearOfIssue) \nОбъем багажника \(trunkVolume)\nДвигатель: \(engine.rawValue)\nОкна: \(windows.rawValue)\nБагажник: \(trunkIsFull.rawValue), текущий объем багажника \(currentVolume) \nТип багажника: \(bodyTrunk.rawValue)"
    }
}

var skodaCar = SportCar(brand: "Skoda", yearOfIssue: 2014, trunkVolume: 530, engine: .start, windows: .open, trunkIsFull: .store, currentVolume: 200, body: .hatchback, drive: .frontWheel)
print(skodaCar)
skodaCar.changeEngineState(state: .turnOff)
skodaCar.changeWindowsState(state: .close)
skodaCar.changeBody(state: .sedan)
skodaCar.changeDrive(state: .fourWheel)
print(skodaCar)

var audiCar = SportCar(brand: "Audi", yearOfIssue: 2020, trunkVolume: 565, engine: .turnOff, windows: .close, trunkIsFull: .empty, currentVolume: 565, body: .sedan, drive: .fourWheel)
print(audiCar)
audiCar.changeWindowsState(state: .open)
audiCar.trunkIsFull = .store
audiCar.currentVolume = 70
print(audiCar)

var manTrunk = TrunkCar(brand: "MAN", yearOfIssue: 1999, trunkVolume: 3000, engine: .turnOff, windows: .close, trunkIsFull: .full, currentVolume: 0, bodyTrunk: .onboard)
manTrunk.changeEngineState(state: .start)
manTrunk.changeWindowsState(state: .open)
print(manTrunk)
manTrunk.identifyTruck()
 
