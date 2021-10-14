import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */



// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.


struct models <T: Comparable> {
    var names: [T] = []
    
    mutating func add (_ name: T){
        names.append(name)
    }
    
    mutating func remove () -> T {
        return names.removeLast()
    }
    
    // 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    
    func filterNames (_ name : T) {
        names.filter { $0 == name }
    }
    
    mutating func sortNames () -> [T] {
        return names.sorted(by: < )
    }
    
    mutating func shuffleNames () -> [T] {
        return names.shuffled()
    }
    
    
    
    //3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript (index: Int) -> T? {
        return ( index < names.count ? names[index]: nil)
    }
    
}



var cars = ["Mazda", "Renault", "Lexus"]
var moreCars = models(names: cars)

moreCars.add("Wolkswagen")
moreCars.add("Lada")
moreCars.remove()
moreCars.add("BMW")
moreCars.add("Toyota")
moreCars.add("Mercedes")

print (moreCars.names)
print (moreCars.sortNames())
print (moreCars.shuffleNames())

