// Паттерн Строитель предлагает вынести конструирование объекта за пределы его собственного класса, поручив это дело отдельным объектам, называемым строителями.
// Строитель — это порождающий паттерн проектирования, который позволяет создавать сложные объекты пошагово.
// Строитель даёт возможность использовать один и тот же код строительства для получения разных представлений объектов.


//----------------------------------ПРОДУКТ----------------------------------
// продукты не имеют общий интерфейс и могут отличаться

class Car {
    var equipment = ""
}

class Manual {
    var instruction = ""
}

//----------------------------------СТРОИТЕЛИ--------------------------------
// Интерфейс строителя объявляет все возможные этапы и шаги
// конфигурации продукта.

protocol Builder {
    func reset()
    func setSeats()
    func setEngine()
    func setTripComputer()
    func setGPS()
}

// Все конкретные строители реализуют общий интерфейс по-своему.

class CarBuilder: Builder {
    
    private var car = Car()
    
    func reset() {
        self.car = Car()
    }
    
    func setSeats() {
        car.equipment = car.equipment + "4 сидения,"
    }
    
    func setEngine() {
        car.equipment = car.equipment + " бензиновый двигатель 2.5 л,"
    }
    
    func setTripComputer() {
        car.equipment = car.equipment + " бортовой компьютер,"
    }
    
    func setGPS() {
        car.equipment = car.equipment + " GPS навигация"
    }
    
    // добавим метод который вернет созданный строителем объект
    func getResults() -> Car {
        return car
    }
}

class ManualBuilder: Builder {
    
    private var manual = Manual()
    
    func reset() {
        self.manual = Manual()
    }
    
    func setSeats() {
        manual.instruction = manual.instruction + "1 Глава. Регулировка сидений."
    }
    
    func setEngine() {
        manual.instruction = manual.instruction + " 2 Глава. Обслуживание бензинового двигателя."
    }
    
    func setTripComputer() {
        manual.instruction = manual.instruction + " 3 Глава. Настройки бортового компьютера."
    }
    
    func setGPS() {
        manual.instruction = manual.instruction + " 4 Глава. Использование GPS навигатора."
    }
    
    // добавим метод который вернет созданный строителем объект
    func getResults() -> Manual {
        return manual
    }
}

//----------------------------------ДИРЕКТОР---------------------------------
// Директор знает, в какой последовательности нужно заставлять
// работать строителя, чтобы получить ту или иную версию
// продукта. Заметьте, что директор работает со строителем через
// общий интерфейс, благодаря чему он не знает тип продукта,
// который изготовляет строитель.
class Director {
    func constructProduct(builder: Builder) {
        builder.reset()
        builder.setSeats()
        builder.setEngine()
        builder.setTripComputer()
        builder.setGPS()
    }
}

//----------------------------------КЛИЕНТ-----------------------------------
// Директор получает объект конкретного строителя от клиента
// (приложения). Приложение само знает, какого строителя нужно
// использовать, чтобы получить определённый продукт.
var director = Director()

var carBuilder = CarBuilder()
var manualBuilder = ManualBuilder()

director.constructProduct(builder: carBuilder)
director.constructProduct(builder: manualBuilder)

// Готовый продукт возвращает строитель, так как
// директор чаще всего не знает и не зависит от
// конкретных классов строителей и продуктов.
let car = carBuilder.getResults()
let manual = manualBuilder.getResults()
print(car.equipment)
print(manual.instruction)
