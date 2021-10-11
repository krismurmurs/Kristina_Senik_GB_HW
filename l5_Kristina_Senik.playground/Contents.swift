import UIKit

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
 */


// Перечисление свойств

enum carBody: String {
    case hatchback = "хэчбэк." , sedan = "седан." , minivan = "минивэн."
}

enum transmissionType: String {
    case manual = "ручная." , automatic = "автомат."
}


// Перечисление функций

enum engineState: String {
    case start = "Двигатель запущен." , stop = "Двигатель выключен."
}

enum windowsState: String {
    case open = "Окна открыты.", closed = "Окна закрыты."
    
}

enum lightsState: String {
    case on = "Фары включены." , off = "Фары выключены."
}


enum spoilerFeatures: String {
    case front = "расположен спереди.", back = "расположен сзади.", roof = "расположен на крыше.", absent = "отсутствует."
}

enum truckBed: String {
    case long = "длинный.", short = "короткий."
}


// Протокол Car + его расширения

protocol Car {
    
    var model: String {get}
    var body: carBody {get}
    var speed: Double {get set}
    var transmission: transmissionType {get}
    var engine: engineState {get set}
    var windows: windowsState {get set}
    var lights: lightsState {get set}
    
    
}


extension Car {
    
    mutating func engineAction (action: engineState) {
        switch action {
        case .start:
            print (action.rawValue)
            self.engine = engine
        case .stop:
            print (action.rawValue)
            self.engine = engine
        }
    }
    
    mutating func windowsAction (action: windowsState){
        switch action {
        case .open:
            print (action.rawValue)
            self.windows = windows
        case .closed:
            print (action.rawValue)
            self.windows = windows
        }
    }
    
    mutating func lightsAction (action: lightsState){
        switch action {
        case .on:
            print (action.rawValue)
            self.lights = lights
        case .off:
            print (action.rawValue)
            self.lights = lights
        }
    }
}

// Подпротоколы + их расширения

protocol sportCar: Car {
    var spoiler: spoilerFeatures {get}
}

extension sportCar {
    func addSpoiler (spoilerCount: Int) {
        switch spoilerCount == 0 {
        case true:
            print ("Спойлеров в машине нет.")
            spoilerFeatures.absent
        case false:
            print ("В машине \(spoilerCount) спойлеров.")
        }
    }
}

protocol truckCar: Car {
    var bed: truckBed {get}
}

extension truckCar {
    func addGasoline (gasolineCount: Double) {
        if gasolineCount == 100 {
            print ("Бак полон.")
        } else {
            let moreGasoline = 100 - gasolineCount
            print ("Необходимо дозаправить бак на \(moreGasoline) литров.")
        }
    }
}



// Классы

class sport: sportCar {
    var model: String
    var body: carBody
    var speed: Double
    var transmission: transmissionType
    var engine: engineState
    var windows: windowsState
    var lights: lightsState
    var spoiler: spoilerFeatures
    
    init(model: String, body: carBody, speed: Double, transmission: transmissionType, engine: engineState, windows: windowsState, lights: lightsState, spoiler: spoilerFeatures) {
        self.model = model
        self.body = body
        self.speed = speed
        self.transmission = transmission
        self.engine = engine
        self.windows = windows
        self.lights = lights
        self.spoiler = spoiler
        
        
        
        
    }
    
}



class truck: truckCar {
    var model: String
    var body: carBody
    var speed: Double
    var transmission: transmissionType
    var engine: engineState
    var windows: windowsState
    var lights: lightsState
    var bed: truckBed
    
    init(model: String, body: carBody, speed: Double, transmission: transmissionType, engine: engineState, windows: windowsState, lights: lightsState, bed: truckBed) {
        self.body = body
        self.speed = speed
        self.transmission = transmission
        self.engine = engine
        self.windows = windows
        self.lights = lights
        self.bed = bed
        self.model = model
        
    }
    
}


// Расширения для CustomStringConvertible

extension sport: CustomStringConvertible {
    var description: String {
        return "Модель автомобиля: \(model) \n Кузов: \(body.rawValue) \n Скорость: \(speed) \n Коробка передач: \(transmission.rawValue) \n \(engine.rawValue) \n \(windows.rawValue) \n \(lights.rawValue) \n Спойлер: \(spoiler.rawValue)"
    }
}

extension truck: CustomStringConvertible {
    var description: String {
        return "Модель автомобиля: \(model) \n Кузов: \(body.rawValue) \n Скорость: \(speed) \n Коробка передач: \(transmission.rawValue) \n \(engine.rawValue) \n \(windows.rawValue) \n \(lights.rawValue) \n Прицеп: \(bed.rawValue)"
    }
}

// Объекты + вывод

var mySportCar = sport (model: "Mercedes", body: .sedan, speed: 200, transmission: .automatic, engine: .start, windows: .closed, lights: .on, spoiler: .back)

var yourSportCar = sport (model: "Mazda", body: .sedan, speed: 150, transmission: .automatic, engine: .stop, windows: .open, lights: .off, spoiler: .roof)

var myTruckCar = truck (model: "Toyota", body: .minivan, speed: 100, transmission: .manual, engine: .stop, windows: .closed, lights: .off, bed: .long)

var yourTruckCar = truck (model: "Citroen", body: .minivan, speed: 80, transmission: .manual, engine: .start, windows: .closed, lights: .off, bed: .short)


myTruckCar.engineAction(action: .start)
yourTruckCar.lightsAction(action: .on)

print (myTruckCar.description)
print (yourSportCar.description)

mySportCar.addSpoiler(spoilerCount: 0)
myTruckCar.addGasoline(gasolineCount: 80)


