import Foundation

final class Service {
    static let shared = Service()
    private init() { }
    
    var nickName : String = ""
    var email : String = ""
    var password : String = ""
    
}
