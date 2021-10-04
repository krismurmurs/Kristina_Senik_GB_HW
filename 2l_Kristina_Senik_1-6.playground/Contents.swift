import UIKit

//1. Написать функцию, которая определяет, четное число или нет.

func findEvenNumber (num: Int) {
    
    if num % 2 == 0 {
        print ("\(num) чётное число.")
    } else {
        print ("\(num) нечётное число.")
    }
}

findEvenNumber(num: 7)
findEvenNumber(num: 8)
findEvenNumber(num: 5)




//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func findTripleNumber (num: Int) {
    
    if num % 3 == 0 {
        print ("\(num) можно разделить на 3 без остатка.")
    } else {
        print ("\(num) нельзя разделить на 3 без остатка.")
    }
}

findTripleNumber(num: 7)
findTripleNumber(num: 6)
findTripleNumber(num: 12)


//3. Создать возрастающий массив из 100 чисел. (массив через Array и Append)

var array: [Int] = []
for i in 1...100 {
    array.append (i)
    }
print (array)


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3. (удаление через remove)

for value in array {
    if (value % 2) == 0 && (value % 3) != 0 {
        array.remove(at: array.firstIndex(of: value)!)
    }
}

print (array)

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.


func fib (_ count: Int) -> [Int] {
    var fibArray = [1,1]
    for i in 0...count {
        fibArray.append (fibArray[i] + fibArray[i+1])
    }
  return fibArray
}
print (fib(50))

/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. */

 var eratArray = [Int](2...100)
 for divider in eratArray {
     for element in eratArray {
         if element % divider == 0 && element != divider {
             eratArray.remove(at: eratArray.firstIndex(of: element)!)
         }
     }
 }

 print (eratArray)

