// Наблюдатель — это поведенческий паттерн, который позволяет объектам оповещать другие объекты об изменениях своего состояния.
// При этом наблюдатели могут свободно подписываться и отписываться от этих оповещений.

//-------------------------------------ИЗДАТЕЛЬ------------------------------
class Publisher {
    
    private lazy var subscribers = [Subscriber]()
    
    func subscribe(_ subscriber: Subscriber) {
        subscribers.append(subscriber)
        print("\(subscriber) - subscribe to Publisher")
    }
    
    func unsubscribe(_ subscriber: Subscriber) {
         if let idx = subscribers.firstIndex(where: { $0 === subscriber }) {
             subscribers.remove(at: idx)
             print("\(subscriber) - unsubscribe")
         }
     }
    
    func notify() {
        subscribers.forEach { $0.update(self)  }
    }
    
    // что-то произошло (вышел новый выпуск) оповестим подписчиков
    func realeseNewIssue() {
        print("Today new realese!")
        notify()
    }
}
//-------------------------------------ПОДПИСЧИК-----------------------------
// все подписчики выполняют протокол с фукнцией update()
// class после имени протокола значит то что только классы смогут подписаться под протоекол
protocol Subscriber: class {
    func update(_ publisher: Publisher)
}

class Subscriber1: Subscriber {
    func update(_ publisher: Publisher) {
        print("new issue got for \(self)")
    }
}

class Subscriber2: Subscriber {
    func update(_ publisher: Publisher) {
        print("new issue got for \(self)")
    }
}
//-------------------------------------КЛИЕНТ--------------------------------
// создаем объекты издателя и подписчиков
let publisher = Publisher()
let subscriber1 = Subscriber1()
let subscriber2 = Subscriber2()

// подпишемся на издателя
publisher.subscribe(subscriber1)
publisher.subscribe(subscriber2)

// вдруг выходит новый выпуск
publisher.realeseNewIssue()

// подписчики напишут в консоле о получении
