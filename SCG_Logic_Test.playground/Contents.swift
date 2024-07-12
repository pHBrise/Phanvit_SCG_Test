import UIKit
/*
1. Please write a function to find the index that has the sum of left’s elements equal to the sum of
right’s elements .
Example 1: input => [1, 3, 5, 7, 9] output => “middle index is 3”
Example 2: input => [3, 6, 8, 1, 5, 10, 1, 7] output => “middle index is 4”
Example 3: input => [3, 5, 6] output => “index not found”
 */
let arr01 = [1, 3, 5, 7, 9]
let arr02 = [2, 4, 6, 8, 10, 5 , 5, 10]
let arr03 = [3, 5, 6]

func sumInt(array:Array<Int>) -> Int {
    var sum = 0
    for int in array {
        sum = sum + int
    }
    return sum
}

func findIndexLeftEqualRight(array:Array<Int>) -> String {
    var left = 0
    var right = 0
    let sum = sumInt(array: array)
    let halfOfSum = sum/2
    
    for (index, element) in array.enumerated() {
        if element + left < halfOfSum {
            left = element + left
        } else {
            right = sum - (element + left)
            if left == right {
                return "Middle index is \(index)"
            }
            break
        }
    }
    return "Index not found"
}

findIndexLeftEqualRight(array: arr01)
findIndexLeftEqualRight(array: arr02)
findIndexLeftEqualRight(array: arr03)
/*
2. Please write a function to detect that incoming string is palindrome or not
Example 1: input => “aka”, output => “aka is a palindrome”
Example 2: input => “Level”, output => “Level is a palindrome”
Example 3: input => “Hello”, output => “Hello isn’t a palindrome”
*/
let string01 = "Aka"
let string02 = "Level"
let string03 = "Hello"

func detectPalindrome(string:String) -> String {
    let characters = Array(string)
    var reverse = ""
    for i in 1...characters.count {
        reverse.append(characters[characters.count - i])
    }
    if string.lowercased() == reverse.lowercased() {
        return "\(string) is a palindrome"
    } else {
        return "\(string) isn't a palindrome"
    }
}


detectPalindrome(string: string01)
detectPalindrome(string: string02)
detectPalindrome(string: string03)

/*
3. [Bonus] Please write a function to find triplets array that the sum of the numbers is equal to
zero
Note:
1. The input array nums may contain duplicate elements, but the solution set must not contain
duplicate triplets.
2. The function should have a time complexity better than O(N^3), where N is the number of
elements in the array nums.
Example1:
input => [-1, -5, -3, 0, 1, 2, -1]
output => [[-3, 1, 2], [-1, -1, 2], [-1, 0, 1]]
Explanation:
-3 + 1 + 2 = 0
-1 + -1 + 2 = 0
-1 + 0 + 1 = 0
Example2:
input => [1, 1, 2]
output => []
Explanation:
There are no matched numbers
Example3:
input => [1]
output => []
Explanation:
There are no matched numbers
*/


let array03_1 = [-1, -5, -3, 0, 1, 2, -1]

func findTripletsIntInArraySumZero(array:Array<Int>) -> Array<Any> {
    
    var triplets:Array<Any> = []
    for i in 0..<array.count {
        var firstNumber = array[i]
        print(firstNumber)
        for j in i+1..<array.count {
            var secondNumber = array[j]
            for k in j+1..<array.count {
                var thirdNumber = array[k]
                if firstNumber + secondNumber + thirdNumber == 0 {
                    triplets.append([firstNumber,secondNumber,thirdNumber])
                }
            }
        }
    }
    
    return triplets
}

findTripletsIntInArraySumZero(array: array03_1)
