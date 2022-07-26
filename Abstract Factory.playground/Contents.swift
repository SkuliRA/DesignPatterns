// Абстрактная фабрика - решает проблему создания целых семейств связанных продуктов, без указания конкретных классов продуктов.

//----------------------------------------ПРОДУКТЫ----------------------------------------------------
//-----абстрактные продукты
// Каждый отдельный продукт семейства продуктов должен иметь базовый интерфейс.
// Все вариации продукта должны реализовывать этот интерфейс.
protocol AbstractChair {
    var name: String { get }
    var type: String { get }
}

protocol AbstractSofa {
    var name: String { get }
    var type: String { get }
}

protocol AbstractTable {
    var name: String { get }
    var type: String { get }
}
//------конкретные продукты

class ArtDecoChair: AbstractChair {
    var name = "Стул"
    var type = "Ар-деко"
}

class ModernChair: AbstractChair {
    var name = "Стул"
    var type = "Модерн"
}

class ArtDecoSofa: AbstractSofa {
    var name = "Диван"
    var type = "Ар-деко"
}

class ModernSofa: AbstractSofa {
    var name = "Диван"
    var type = "Модерн"
}

class ArtDecoTable: AbstractTable {
    var name = "Стол"
    var type = "Ар-деко"
}

class ModernTable: AbstractTable {
    var name = "Стол"
    var type = "Модерн"
}

//----------------------------------------ФАБРИКИ----------------------------------------------------

// Интерфейс Абстрактной Фабрики объявляет набор методов, которые возвращают
// различные абстрактные продукты. Эти продукты называются семейством и связаны
// темой или концепцией высокого уровня. Продукты одного семейства обычно могут
// взаимодействовать между собой. Семейство продуктов может иметь несколько
// вариаций, но продукты одной вариации несовместимы с продуктами другой.
protocol AbstractFactory {
    func produceChair() -> AbstractChair
    func produceSofa() -> AbstractSofa
    func produceTable() -> AbstractTable
}

// Конкретная Фабрика производит семейство продуктов одной вариации. Фабрика
// гарантирует совместимость полученных продуктов. Обратите внимание, что
// сигнатуры методов Конкретной Фабрики возвращают абстрактный продукт, в то
// время как внутри метода создается экземпляр конкретного продукта.
class ArtDecoFactory: AbstractFactory {
    func produceChair() -> AbstractChair {
        return ArtDecoChair()
    }
    
    func produceSofa() -> AbstractSofa {
        return ArtDecoSofa()
    }
    
    func produceTable() -> AbstractTable {
        return ArtDecoTable()
    }
}

class ModernFactory: AbstractFactory {
    func produceChair() -> AbstractChair {
        return ModernChair()
    }
    
    func produceSofa() -> AbstractSofa {
        return ModernSofa()
    }
    
    func produceTable() -> AbstractTable {
        return ModernTable()
    }
}

//-----------------------------------------КЛИЕНТ----------------------------------------------------

// клиентская функция не знает какой конкретный тип фабрики будет передан
func produceFurniture(_ factory: AbstractFactory) {
    let chair = factory.produceChair()
    print("Фабрика произвела \(chair.name) в стиле \(chair.type)")
    let sofa = factory.produceSofa()
    print("Фабрика произвела \(sofa.name) в стиле \(sofa.type)")
    let table = factory.produceTable()
    print("Фабрика произвела \(table.name) в стиле \(table.type)")
}

// передаем в клиентскую функцию любой тип фабрики
let modernFactory = ModernFactory()
produceFurniture(modernFactory)

let artDecoFactory = ArtDecoFactory()
produceFurniture(artDecoFactory)
