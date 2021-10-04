import UIKit


enum carActions {
    enum engine: String {
        case start = "Двигатель запущен."
        case stop = "Двигатель выключен."
    }
    
    enum carBody: String {
        case hatchback = "хэчбэк"
        case sedan = "седан"
        case minivan = "минивэн"
        
    }
    
    enum windows: String {
        case open = "Окна открыты."
        case closed = "Окна закрыты."
        
    }
    
    enum trunk: String {
        case open = "Багажник открыт."
        case closed = "Багажник закрыт."
        
    }
}


struct car {
    
    var model: String
    var year: Int
    var trunkState: carActions.trunk
    var body: carActions.carBody
    var engineState: carActions.engine
    var windowsState: carActions.windows
    
    
    mutating func engineSelect (carActions: carActions.engine) {
        switch carActions {
        case .start:
            print (carActions.rawValue)
            self.engineState = .start
        case .stop:
            print (carActions.rawValue)
            self.engineState = .stop
        }
    }
    mutating func windowsSelect (carActions: carActions.windows) {
        switch carActions {
        case .open:
            print (carActions.rawValue)
            self.windowsState = .open
        case .closed:
            print (carActions.rawValue)
            self.windowsState = .closed
        }
    }
    mutating func carBodySelect (carActions: carActions.carBody) {
        switch carActions {
        case .hatchback:
            print (carActions.rawValue)
            self.body = .hatchback
        case .sedan:
            print (carActions.rawValue)
            self.body = .sedan
        case .minivan:
            print (carActions.rawValue)
            self.body = .minivan
        }
    }
    
    
    
    
}


var sportCar = car (model: "Mazda", year: 2013, trunkState: .open, body: .sedan, engineState: .stop, windowsState: .open)
var truckCar = car (model: "Mercedes", year: 1994, trunkState: .closed, body: .minivan, engineState: .stop, windowsState: .open)



func outputSport() {
    print ("\(sportCar.model) - это легковая машина, \(sportCar.year) года. \(sportCar.engineState.rawValue) \(sportCar.windowsState.rawValue) Тип кузова - \(sportCar.body.rawValue). \(sportCar.trunkState.rawValue)")
}

func outputTruck() {
    print  ("\(truckCar.model) - это грузовая машина, \(truckCar.year) года. \(truckCar.engineState.rawValue) \(truckCar.windowsState.rawValue) Тип кузова - \(truckCar.body.rawValue). \(truckCar.trunkState.rawValue)")
}


outputSport()
outputTruck()

sportCar.carBodySelect(carActions: .minivan)
sportCar.windowsSelect(carActions: .closed)

truckCar.engineSelect(carActions: .start)

outputSport()
outputTruck()
