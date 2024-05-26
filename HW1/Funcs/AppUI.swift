import Foundation
import UIKit

final class AppUI {
    
    static func createView(withSize size: CGRect, bgColor: UIColor, cornerRadius: CGFloat) -> UIView {
        {
            $0.backgroundColor = bgColor
            $0.layer.cornerRadius = cornerRadius
            return $0
        }(UIView(frame: size))
    }
    
    static func createTextField(withSize size: CGRect) -> UITextField {
        {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
            $0.leftView = leftView
            $0.leftViewMode = .always
            return $0
        }(UITextField(frame: size))
    }
    
    static func createLabel(withSize size: CGRect, text: String, textColor: UIColor, textAlignment: NSTextAlignment, fontSize: CGFloat, fontWeight: UIFont.Weight) -> UILabel {
        {
            $0.text = text
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
            $0.numberOfLines = 0
            return $0
        }(UILabel(frame: size))
    }
    
}
