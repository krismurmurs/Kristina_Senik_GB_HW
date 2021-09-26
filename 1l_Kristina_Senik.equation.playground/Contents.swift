import UIKit

/*
 ax^2+bx+c=0
 D = b2 − 4ac
 
 Если D < 0, корней нет;
 Если D = 0, есть ровно один корень;
 Если D > 0, корней будет два.
*/


print ("Решаем квадратное уравнение.")

let a: Float = 2
let b: Float = 5
let c: Float = 1
var x1: Float
var x2: Float
var D: Float
var x1R: String
var x2R: String

D = b * b - 4 * a * c

if D == 0 {
    x1 = (-b + sqrt(D)) / (2 * a)
    x1R = String(format: "%.02f ", x1)
    print ("x будет равен \(x1R).")
} else if D > 0 {
    x1 = (-b + sqrt(D)) / (2 * a)
    x1R = String(format: "%.02f ", x1)
    x2 = (-b - sqrt(D)) / (2 * a)
    x2R = String(format: "%.02f ", x2)
    print ("x1 ≈ \(x1R).")
    print ("x2 ≈ \(x2R).")
} else {
    print ("Уравнение не имеет действительных решений. Попробуй ещё раз.")
}


