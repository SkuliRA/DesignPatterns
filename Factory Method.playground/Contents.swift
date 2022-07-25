// Фабричный метод - определяет общий интерфейс для создания объектов в суперклассе,
// позволяя подклассам изменять тип создаваемых объектов

//----------------------------ПРОДУКТЫ----------------------------------------------
// Протокол Продукта объявляет операции, которые должны выполнять все
// конкретные продукты.

protocol Exercise {
    var name: String { get }
    
    func start()
    func stop()
}

// Конкретные Продукты предоставляют различные реализации протокола Продукта.
class Jumping: Exercise {
    
    var name = "Прыжки"
    
    func start() {
        print("Начинаю прыжки")
    }
    
    func stop() {
        print("Заканчиваю прыжки")
    }
}

class Squarts: Exercise {
   
    var name = "Приседания"
    
    func start() {
        print("Начинаю приседания")
    }
    
    func stop() {
        print("Заканчиваю приседания")
    }
}

//-----------------------------ФАБРИКА-------------------------------------------------

enum Exercises {
    case jumping, squarts
}

class FactoryExercises {
    // фабричный метод возвращает объекты требуемых классов
    func factoryMethod(_ exercise: Exercises) -> Exercise {
        switch exercise {
        case .jumping:
            return Jumping()
        case .squarts:
            return Squarts()
        }
    }
}

//-----------------------------КЛИЕНТ---------------------------------------------------

var arrayExercises = [Exercise]()

let factory = FactoryExercises()

// используя фабричный метод создадим пару разных объектов
let jumping = factory.factoryMethod(.jumping)
let squarts = factory.factoryMethod(.squarts)

arrayExercises.append(jumping)
arrayExercises.append(squarts)

// выполним упражнения из массива
for obj in arrayExercises {
    obj.start()
    obj.stop()
}
