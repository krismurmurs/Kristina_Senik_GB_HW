import UIKit

print ("Высчитываем доходы с вклада.")

/*
 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
 Начальный вклад = 5000
 Ставка = 10%
 */

let sum: Int = 5000
let percent: Float = 0.1
var year0: Int = 0
let year5: Int = 5
var money = Float (sum)

while (year0 < year5){
    year0 += 1
    money = money + money * percent
    print("Сумма вклада за год \(year0) составляет \(money).")
}

