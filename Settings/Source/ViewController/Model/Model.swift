import UIKit

struct Setting {
    var iconImage: UIImage?
    var text: String
    var backgroundColor: UIColor
    var tintColor: UIColor = .white
}

extension Setting {
    static var settings: [[Setting]] = [
        [
            Setting(iconImage: UIImage(systemName: "airplane"), text: "Авиарежим", backgroundColor: .systemOrange),
            Setting(iconImage: UIImage(systemName: "wifi"), text: "WLAN", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "bluetooth"), text: "Bluetooth", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "antenna.radiowaves.left.and.right"), text: "Сотовая связь", backgroundColor: .systemGreen),
            Setting(iconImage: UIImage(systemName: "personalhotspot"), text: "Режим модема", backgroundColor: .systemGreen)
        ],
        [
            Setting(iconImage: UIImage(systemName: "notification"), text: "Уведомления", backgroundColor: .systemRed),
            Setting(iconImage: UIImage(systemName: "sound"), text: "Звуки, тактильные сигналы", backgroundColor: .systemPink),
            Setting(iconImage: UIImage(systemName: "moon"), text: "Фокусирование", backgroundColor: .systemPurple),
            Setting(iconImage: UIImage(systemName: "hourglass"), text: "Экранное время", backgroundColor: .systemPurple)
        ],
        [
            Setting(iconImage: UIImage(systemName: "gear"), text: "Основные", backgroundColor: .systemGray4),
            Setting(iconImage: UIImage(systemName: "switch.2"), text: "Пункт управления", backgroundColor: .systemGray4),
            Setting(iconImage: UIImage(systemName: "textformat.size"), text: "Экран и яркость", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "square.grid.3x3.middle.filled"), text: "Экран «Домой»‎", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "sparkles.rectangle.stack.fill"), text: "Универсальный доступ", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "signature"), text: "Обои", backgroundColor: .systemBlue),
            Setting(iconImage: UIImage(systemName: "person"), text: "Siri и Поиск", backgroundColor: .black),
            Setting(iconImage: UIImage(systemName: "faceid"), text: "Face ID и код пароль", backgroundColor: .systemGreen),
            Setting(iconImage: UIImage(systemName: "sos"), text: "Экстренный вызов - SOS", backgroundColor: .systemRed),
            Setting(iconImage: UIImage(systemName: "microbe.fill"), text: "Уведомления о контакте", backgroundColor: .white, tintColor: .red),
            Setting(iconImage: UIImage(systemName: "battery.100"), text: "Аккумулятор", backgroundColor: .systemGreen),
            Setting(iconImage: UIImage(systemName: "lock.doc"), text: "Конфидециальность и безопасность", backgroundColor: .systemBlue)
        ]
    ]
}
