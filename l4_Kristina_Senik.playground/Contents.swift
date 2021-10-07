import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести значения свойств экземпляров в консоль.
 */




enum carListing {
    
    enum carActions {
        enum engine: String {
            case start = "Двигатель запущен."
            case stop = "Двигатель выключен."
        }
        
        enum carBody: String {
            case hatchback = "хэчбэк."
            case sedan = "седан."
            case minivan = "минивэн."
            
        }
        
        enum windows: String {
            case open = "Окна открыты."
            case closed = "Окна закрыты."
            
        }
        
        enum trunk: String {
            case open = "Багажник открыт."
            case closed = "Багажник закрыт."
            
        }
        
        enum bedState: String {
            case connected = "Прицеп закреплён"
            case disconnected = "Прицеп откреплён"
        }
        
        enum spoilerState: String {
            case connected = "Спойлер закреплён"
            case disconnected = "Спойлер откреплён"
        }
    }
    enum carFeatures {
        enum sportCarFeatures{
            enum spoilerFeatures: String {
                case front = "расположен спереди.", back = "расположен сзади.", roof = "расположен на крыше."
            }
        }
        enum truckCarFeatures {
            enum truckBed: String {
                case long = "длинный.", short = "короткий."
            }
        }
    }
}





class car {
    var model: String
    var color: UIColor
    var speed: Double = 0.0
    var trunkState: carListing.carActions.trunk
    var body: carListing.carActions.carBody
    var engineState: carListing.carActions.engine
    var windowsState: carListing.carActions.windows
    
    init (model: String, color: UIColor, speed: Double, trunkState: carListing.carActions.trunk, body: carListing.carActions.carBody, engineState: carListing.carActions.engine, windowsState: carListing.carActions.windows) {
        self.model = model
        self.color = color
        self.speed = speed
        self.trunkState = carListing.carActions.trunk.open
        self.body = carListing.carActions.carBody.hatchback
        self.engineState = carListing.carActions.engine.start
        self.windowsState = carListing.carActions.windows.closed
    }
    
    func engineSelect (carActions: carListing.carActions.engine) {
        switch carActions {
        case .start:
            print (carActions.rawValue)
            self.engineState = .start
        case .stop:
            print (carActions.rawValue)
            self.engineState = .stop
            
        }
    }
    func windowsSelect (carListings: carListing.carActions.windows) {
        switch carListings {
        case .open:
            print (carListings.rawValue)
            self.windowsState = .open
        case .closed:
            print (carListings.rawValue)
            self.windowsState = .closed
        }
    }
    func carBodySelect (carListings: carListing.carActions.carBody) {
        switch carListings {
        case .hatchback:
            print (carListings.rawValue)
            self.body = .hatchback
        case .sedan:
            print (carListings.rawValue)
            self.body = .sedan
        case .minivan:
            print (carListings.rawValue)
            self.body = .minivan
        }
    }
}



class sportCar: car {
    var spoiler: carListing.carFeatures.sportCarFeatures.spoilerFeatures
    var spoilerState: carListing.carActions.spoilerState
    
    init (spoiler: carListing.carFeatures.sportCarFeatures.spoilerFeatures, spoilerState: carListing.carActions.spoilerState){
        self.spoiler = spoiler
        self.spoilerState = spoilerState
        super.init(model: "Mazda", color: .blue, speed: 200, trunkState: .open, body: carListing.carActions.carBody.hatchback, engineState: carListing.carActions.engine.start, windowsState: carListing.carActions.windows.closed)
    }
    func spoilerSelect (carActions: carListing.carActions.spoilerState) {
        switch carActions {
        case .connected:
            print (carActions.rawValue)
            self.spoilerState = .connected
        case .disconnected:
            print (carActions.rawValue)
            self.spoilerState = .disconnected
        }
    }
}


class trunkCar: car {
    var bed: carListing.carFeatures.truckCarFeatures.truckBed
    var bedState: carListing.carActions.bedState
    
    init (bed: carListing.carFeatures.truckCarFeatures.truckBed, bedState: carListing.carActions.bedState) {
        self.bed = bed
        self.bedState = bedState
        super.init(model: "Mercedes", color: .black, speed: 100, trunkState: .closed, body: .minivan, engineState: .start, windowsState: .open)
    }
    
    func bedSelect (carActions: carListing.carActions.bedState) {
        switch carActions {
        case .connected:
            print (carActions.rawValue)
            self.bedState = .connected
        case .disconnected:
            print (carActions.rawValue)
            self.bedState = .disconnected
        }
        
        
        
    }
}

let myCar = sportCar (spoiler: .back, spoilerState: .connected)
let yourCar = trunkCar (bed: .long, bedState: .disconnected)


func describeMyCar() {
    print (
        "Данный автомобиль имеете следующие характеристики: \n Модель: \(myCar.model) \n Цвет: \(myCar.color.accessibilityName) \n Скорость: \(myCar.speed) \n \(myCar.trunkState.rawValue) \n Кузов: \(myCar.body.rawValue) \n \(myCar.engineState.rawValue) \n \(myCar.windowsState.rawValue) \n \(myCar.spoilerState.rawValue) и \(myCar.spoiler.rawValue)")
    
}

func describeYourCar() {
    print (
        "Данный автомобиль имеете следующие характеристики: \n Модель: \(yourCar.model) \n Цвет: \(yourCar.color.accessibilityName) \n Скорость: \(yourCar.speed) \n \(yourCar.trunkState.rawValue) \n Кузов: \(yourCar.body.rawValue) \n \(yourCar.engineState.rawValue) \n \(yourCar.windowsState.rawValue) \n \(yourCar.bedState.rawValue) и \(yourCar.bed.rawValue)")
    
}


myCar.engineSelect(carActions: .start)
yourCar.bedSelect(carActions: .disconnected)

describeMyCar()
describeYourCar()


