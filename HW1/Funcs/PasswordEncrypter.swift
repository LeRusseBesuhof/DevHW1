import Foundation

final class PasswordEncrypter {
    static func encrypt(text: String) -> String {
        let length = text.count
        var hiddenString = ""
        for _ in 0..<length {
            hiddenString += "*"
        }
        return hiddenString
    }
}
