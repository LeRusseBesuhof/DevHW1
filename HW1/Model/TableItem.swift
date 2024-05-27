import Foundation

struct TableItem : Identifiable, ItemProtocol {
    internal var id : String = UUID().uuidString
    internal let textField : String
    
    static internal func getMockRegisterData() -> [TableItem] {
        return [TableItem(textField: "Имя")] + TableItem.getMockEnterData()
    }
    
    static internal func getMockEnterData() -> [TableItem] {
        [
            TableItem(textField: "Почта"),
            TableItem(textField: "Пароль")
        ]
    }
}
