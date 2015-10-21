//: Playground - noun: a place where people can play

import UIKit

class MenuItems {
    var name:String
    var price:Double
    var number:Int?
    var desctiprion:String?
    
    init(name:String, price:Double) {
        self.name = "Salad"
        self.price = 10.00
        
        println("You are now ready to order")
    }
    func tellPrice () {
        if let orderNumber = number {
            println("Your \(self.name) will cost \(Double(orderNumber) * price) ")
        } else {
            println("Your \(self.name) will cost \(price) dollars")
        }
        
    }
    func edit (changeOrder:String) {
        println(changeOrder)
    }
    func rate(numStars:Int) {
        println("This salad gets \(numStars) stars")
    }
}

var salad = MenuItems(name:"Salad", price:10);
salad.tellPrice();
salad.edit("Extra bacon!")
salad.number = 3;

salad.tellPrice()

salad.rate(3)


var alPastorBurrito = MenuItems(name:"Al Pastro Burrito", price:10)


func totalCost(item1:MenuItems, item2:MenuItems) {
//    guard let _ = item1 { }
//    guard let _ = item2 { }
    var totalPrice : Double
    if let _item1 = item1.number {
        if let _item2 = item2.number {
            totalPrice = (item1.price * _item1.number) + (_item2.price * _item2.number)
            
        } else {
            totalPrice = (item1.price * _item1.number) + item2.price
        }
        totalPrice = item1.price + item2.price
    }
    if let _item2 = item2.number {
        
    }
    
    
}
