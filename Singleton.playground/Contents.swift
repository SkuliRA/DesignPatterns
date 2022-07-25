import UIKit

// Синглтон гарантирует что у класса есть только один экземпляр и предоставляет к нему глобальную точку доступа
// Пример - хранимые настройки плеера по умолчанию
class Settings {
    
    // настройки цвета и громкости
    var color = UIColor.blue
    var volume = 40
    
    // все объекты статик живут пока работает приложение
    static var shared = Settings()
    
    // Инициализатор Одиночки всегда должен быть скрытым, чтобы предотвратить
    // прямое создание объекта через инициализатор.
    private init() {}
}

// клиентский код
// сохраним текущие значения настроек в кортеж
// обращаемся к нашему единственному объекту чтобы получить настройки
var currentSettings: (color: UIColor, volume: Int)
currentSettings.color = Settings.shared.color
currentSettings.volume = Settings.shared.volume

//установим новые настройки по умолчанию для плеера
Settings.shared.color = UIColor.brown
Settings.shared.volume = 20
