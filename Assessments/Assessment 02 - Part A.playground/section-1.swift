// Intro to Swift in class playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name : String = "Tess";
var age : Int = 27;

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!")

// TODO: Print "You can drink" if the person is at least 21 years old. If he/she is at least 18, print "you can vote." If the user is at least 16, print "You can drive."

if (age >= 21) {
    println("You can drink")
} else if (age >= 18) {
    println("you can vote")
} else if (age >= 16) {
    println("you can drive")
};

// TODO: Print "you can drive" if the user is older than 16 but younger than 18. It should print, "You can drive and vote", if the user is at least 18 but younger than 21. If the user is at least 21, it should print, "You can drive, vote and drink (but not at the same time!)".

if (age >= 21) {
    println("You can drive, vote and drink (but not at the same time!)")
} else if (age >= 18) {
    println("You can drive and vote")
} else if (age >= 16 ) {
    println("you can drive");
};

// TODO: Print the first fifty multiples of seven minus one. (e.g. The first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20.)

for (var i = 0; i < 50; i++){
    var multiplesOfSeven = 7 * i;
    var multiplesOfSevenMinusOne = (7 * i) - 1;
    println(multiplesOfSeven);
    println(multiplesOfSevenMinusOne);
};


// TODO: Create a constant called number.

let number = 7;

// TODO: Compute whether the above number is even.

if (number % 2 == 1) {
    println("number is odd")
} else {
    println("number is even")
};

// TODO: Print "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use count().

println("Hello \(name), your name is \(count(name)) ");

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

for _ in 1...8 {
    println(Int(rand()))
};

// TODO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

for i in 1...100 {
    if ((i % 3 == 0) && (i % 5 == 0)){
        println("FizzBuzz")
    } else if (i % 3 == 0) {
        println("Buzz")
    } else if (i % 5 == 0) {
        println("Fizz")
    };
};

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var lastFibonacciNumber = 0;
var currentfibonacciNumber = 1;

for (var i = 0; i < 36; i++) {
    
    var newFibonacciNumber  = currentfibonacciNumber + lastFibonacciNumber;
    println(newFibonacciNumber);
    
    //    update values
    lastFibonacciNumber = currentfibonacciNumber;
    currentfibonacciNumber = newFibonacciNumber;
};
