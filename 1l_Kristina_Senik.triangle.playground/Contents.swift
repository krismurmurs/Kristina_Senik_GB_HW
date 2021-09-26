import UIKit

print ("Исчем площадь, периметр и гипотенузу.")

/*
 S = 1/2 (k1 + k2)
 P = a + b + c
 c2 = a2 + b2
*/

let k1: Float = 1
let k2: Float = 2
let k3: Float = sqrt(k1 * k1 + k2 * k2)

var S = (k1 * k2) / 2
var P = k1 + k2 + k3
var G = k3

var PRound = String(format: "%.02f ", P)
var GRound = String(format: "%.02f ", G)

print ("Площадь равна var \(S)")
print ("Периметр равен \(PRound)")
print ("Гипотенуза равна \(GRound)")
