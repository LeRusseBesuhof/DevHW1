import Foundation
import UIKit

enum LibreBaskervilleType : String {
    case regular = "LibreBaskerville-Regular"
    case bold = "LibreBaskerville-Bold"
}

enum ComfortaaType : String {
    case regular = "Comfortaa-Regular"
    case bold = "Comfortaa-Bold"
}

extension UIFont {
    static func getLibreBaskervilleFont(fontType: LibreBaskervilleType = .regular, fontSize: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func getComfortaaFont(fontType: ComfortaaType = .regular, fontSize: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
