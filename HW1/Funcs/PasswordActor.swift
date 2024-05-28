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
    
    static func checkData(email: String, password: String) -> Bool {
        if Service.shared.email.isEmpty && Service.shared.password.isEmpty { return false }
        else { return email == Service.shared.email && password == Service.shared.password }
    }
}
