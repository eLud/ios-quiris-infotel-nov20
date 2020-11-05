import UIKit

let str = "{text:\"Hello, playground\"}"
print(str)

let name = "Ludovic"
//name = "Victor" //Cannot assign to value: 'name' is a 'let' constant

var age = 34

var height: Float = 1.85

let a = 5
let b = 2

let c = Double(a) / Double(b) //Valeur de c

//age / height

//Collections

//Tableaux
var tab: [String] = ["Paris", "Nantes", "Marseille"]
let tab2: Array<String> = ["Paris", "Nantes", "Marseille"]

tab.append("Lyon")
let fourth = tab[3]
tab[0] = "Lille"
tab.insert("Test", at: 0)
tab.insert(contentsOf: ["Test"], at: 0)
tab.append("Test")
tab.append(contentsOf: [""])

var emptyTab: [String] = []
var emptyTab2: Array<String> = []
var emptyTab3 = [String]()
var emptyTab4 = Array<String>()

//Dictionaires
var dico: [String:String] = ["firstName" : "Ludovic"]
var dico2: Dictionary<String,String> = ["firstName" : "Ludovic"]

dico["lastName"] = "Ollagner"
dico["lastName"] = "Ollagnier"
let last = dico["toto"]
dico.updateValue("hello", forKey: "toto")
dico.updateValue("", forKey: "toto")

//Remove element
dico.removeValue(forKey: "lastName")
dico["lastName"] = nil

var emptyDico: [String:String] = [:]

// Dictionary -> Swift (Structure)
// NSDictionary -> Objective-C (Classe)
//let dico = NSDictionary(objects: ["Ludovic", "Ollagnier"], forKeys: ["firstName", "lastName"])

//Ensembles

var emptySet = Set<String>()

var cities: Set = ["Paris", "Lyon"]
cities.count

cities.insert("Paris")
cities.count

let result = cities.insert("Nantes")
cities.count

result.inserted

var citiesOther: Set = ["Paris", "Marseille"]
cities.intersection(citiesOther)
cities.symmetricDifference(citiesOther)

cities.contains("Paris") //O(1) -> Constante
tab.contains("Paris") // O(n) n = nombre elements -> Linéaire

// == Equality (class/struct)
// === Identity (class)

struct Person: Equatable, Hashable {
    let firstName: String
    let lastName: String

    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

let p1 = Person(firstName: "Jean", lastName: "Bombeur")
let p2 = Person(firstName: "Paul", lastName: "Auchon")

p1 == p2

for i in stride(from: 0, through: 10, by: 0.5) {
    print(i)
}

for i in 0...10 {
    print(i)
}

tab.forEach { (str) in
    print(str)
}

var i = 0
i += 1

// ternaire
// let valeur = condition ? si_vrai : si_faux

var greeting = "Good Morning"

switch greeting {
case "Good Morning":
    print("It's morning")
case "Bonne soirée":
    fallthrough
case "Good Evening", "Good Night":
    print("It's evening")
    break
default:
    break
}

switch true {
case 0==0:
    print("toto")
default:
    break
}

guard !tab.isEmpty else { fatalError() }
print("Something with tab")

func eat(aliment: String) {
    print("eat1")
}

func eat(aliment: String, with friend: String = "Personne", truc: String = "", _ bidule: String) {
    print("eat2")
}

eat(aliment: "Pizza")

eat(aliment: "Pizza", "")


/// Make a multiplicatioon
/// - Parameters:
///   - firstNumber: First Number
///   - secondNumber: Second
/// - Returns: The result
func multiply(_ firstNumber: Int, by secondNumber: Int) -> Int {
    return firstNumber * secondNumber
}

multiply(5, by: 2)

