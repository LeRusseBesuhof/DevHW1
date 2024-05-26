import Foundation

final class Service {
    static let shared = Service()
    private init() { }
    
    var nickName : String? = "user"
    var email : String? = "ivanIvanov@gmail.com"
    var password : String? = "admin"
    
    
}
