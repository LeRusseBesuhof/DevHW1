import Foundation

struct RegisterItem : Identifiable {
    internal var id : String = UUID().uuidString
    let textField : String
    
    static internal func getMockData() -> [RegisterItem] {
        [
            RegisterItem(textField: "Имя"),
            RegisterItem(textField: "Почта"),
            RegisterItem(textField: "Пароль")
        ]
    }
}
