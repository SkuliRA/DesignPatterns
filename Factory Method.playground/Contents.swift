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

protocol Factory {
    func factoryMethod() -> Exercise
}

// конкретные фабрики

class FactoryJumping: Factory {
    func factoryMethod() -> Exercise {
        return Jumping()
    }
}

class FactorySquarts: Factory {
    func factoryMethod() -> Exercise {
        return Squarts()
    }
}

//-----------------------------КЛИЕНТ---------------------------------------------------

func performExercise(_ concretFactory: Factory) {
    let exercise = concretFactory.factoryMethod()
    exercise.start()
    exercise.stop()
}

let factoryJumping = FactoryJumping()
performExercise(factoryJumping)

let factorySquart = FactorySquarts()
performExercise(factorySquart)
