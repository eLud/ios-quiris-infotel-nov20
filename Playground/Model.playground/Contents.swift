import UIKit

// Structures
let str: String = "String"
let age: Int = 34
let something: Bool = false
let tab: Array<String> = ["", ""]

struct GamingCharacter: Equatable, Hashable {
    let name: String
    var age: Int
    var healthPoints: Int
    var isAlive: Bool

    init(name: String, age: Int, healthPoints: Int, isAlive: Bool = true) {
        self.name = name
        self.age = age
        self.healthPoints = healthPoints
        self.isAlive = isAlive
    }

    func kill() {

    }
}

// Memberwise init (init généré automatiquement par Swift pour les structures)
var perso = GamingCharacter(name: "Toto",
                            age: 20,
                            healthPoints: 20,
                            isAlive: true)
// Classes
class Monster {
    let name: String
    var age: Int
    var healthPoints: Int
    var isAlive: Bool

    init(name: String, age: Int, healthPoints: Int, isAlive: Bool = true) {
        self.name = name
        self.age = age
        self.healthPoints = healthPoints
        self.isAlive = isAlive
    }

    // Convenience car utilise un autre init du même type
    convenience init(character: GamingCharacter) {
        self.init(name: character.name,
                  age: character.age,
                  healthPoints: character.healthPoints,
                  isAlive: character.isAlive)
    }

    func kill() {
        let toto = "Test"
    }
}

class Boss: Monster {

    let superPower: String? // Optional<String>

    init(name: String, age: Int, healthPoints: Int, isAlive: Bool, superPower: String?) {
        self.superPower = superPower
        super.init(name: name, age: age, healthPoints: healthPoints)
    }
}

let smallBoss = Boss(name: "Small", age: 10, healthPoints: 200, isAlive: true, superPower: "Voler")

// if let test et déballe si valeur présente
if let power = smallBoss.superPower {
    print(power)
} else {
    print("monstre sans super pouvoir")
}

let jsonValue: Any = "This is a string"
if let jsonString = jsonValue as? String {
    print(jsonString)
}

if let doubleValue = Double("0.76") {
    doubleValue * 0.75
}

guard let superPowerUpper = smallBoss.superPower?.uppercased() else { fatalError() }
print(superPowerUpper)

let monster = Monster(character: perso)
monster.age = 10
let monster2 = monster
monster2.age = 20
monster2.age
monster.age

perso.age = 10
var perso2 = perso
perso2.age = 20
perso.age
perso2.age

// Différences
// Struct                          | Class
//_________________________________|_________________________________
// Value type (copie)              | Reference type (utilise des pointeurs)
// Ne font pas d'héritage          | Peuvent faire de l'héritage
// Peut générer son init           | On doit créer son init

// Enumerations


// Modéliser Tache -> Structure
// - duration / completed / dueDate / percentage / name / detail / state (open / doing / closed)
// -

// Modéliser TrucLibrary -> Classe
// - [Truc]
//
// - func add(Truc)
// - func list -> [Truc]
// - func remove(Truc)

enum State {
    case toDo
    case doing
    case done
    case canceled
}

struct Task: Equatable {
    var name: String
    var state: State

    init(name: String, state: State = .toDo) {
        self.name = name
        self.state = state
    }

    mutating func begin() {
        state = State.doing
    }

    func toto() {
        print("toto")
    }
}

let training = Task(name: "iOS Training", state: .doing)
training.toto()

class Library {

    private(set) var tasks: [Task] = []

    // Computed property
//    var allTasks: [Task] {
//        return tasks
//    }

    func add(_ task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }

    func remove(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
    }
}

let library = Library()
library.tasks
//library.tasks.removeAll()
//library = Library()


struct Point {
    var x: Double
    var y: Double
}

struct Size {
    var width: Double
    var height: Double

    // Get-only computed property
    var area: Double {
        return width * height
    }
}

var mySize = Size(width: 10, height: 10)
mySize.area

struct Rectangle {
    var origin: Point
    var size: Size

    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }

        set {
            self.origin = Point(x: newValue.x - size.width / 2, y: newValue.y - size.height / 2)
        }
    }
}

var myRect = Rectangle(origin: Point(x: 0, y: 0), size: mySize)
myRect.center
myRect.center = Point(x: 10, y: 10)
myRect.origin
