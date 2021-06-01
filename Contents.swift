import UIKit

var greeting = "Hello, playground"
//var completionHandlers = [() -> Void]()
//
//func  someFunction(handler:  @escaping () -> Void) {
//    completionHandlers.append(handler)
//}

// Check how strong reference works By  Apple docs
class  Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?
// Above there new variables hold strog reference  to Person. Strong

ref1  = Person(name: "Sandeep")
ref2 = ref1
ref3 = ref1


ref1  = nil
ref2  = nil
ref3  = nil
//Remove strong reference by set to nil for all three variable

// By weak reference
// See what is going on here.
// If we marked tenant as weak there will be strong referece by it can set to nil as soon you make john and unnit4a to nil.
// If we remove weak keyword from tenant ARC will not be able deallocate and strong reference never drop to 0
class Apartment {
    let unit: String
    init(unit:String) {
        self.unit = unit
    }
   weak var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "Sandeep Tomar")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil


