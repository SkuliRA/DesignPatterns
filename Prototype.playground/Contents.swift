//Прототип — это порождающий паттерн проектирования, который позволяет копировать объекты, не вдаваясь в подробности их реализации.

//-----------------------------ПРОТОТИП---------------------------------------

// интерфейс прототипа
protocol Prototype {
    init(_ prototype: Self)
}

// добавим реализацию метода clone() к протоколу
extension Prototype {
    func clone() -> Self {
        return type(of: self).init(self)
    }
}

// подписываясь под протокол мы должны будем реализовать инициализатор из протокола
// функция clone() будет вызывать этот инициализатор передавая в параметре оъект этого класса
class Hero: Prototype {
    
    var name = ""
    var age = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required convenience init(_ prototype: Hero) {
        self.init(name: prototype.name, age: prototype.age)
    }
}

//-----------------------------КЛИЕНТ-----------------------------------------
// создадим джима
var jim = Hero(name: "Jim", age: 25)
// клонируем джима в джека
var jack = jim.clone()
// задаим клону имя Джек
jack.name = "Jack"
// проверим имя, возраст (остался возвраст клона) и то что джим и джек разные объекты
print(jack.name)
print(jack.age)
print(jim === jack)
