import Foundation

final class PasswordActor {
    static func encrypt(text: String) -> String {
        let length = text.count
        var hiddenString = ""
        for _ in 0..<length {
            hiddenString += "*"
        }
        return hiddenString
    }
    
    static func checkData(nickName: String, password: String) -> Bool {
        nickName == Service.shared.nickName && password == Service.shared.password
    }
}
