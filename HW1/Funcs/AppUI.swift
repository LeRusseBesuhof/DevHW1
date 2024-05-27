import Foundation
import UIKit

final class AppUI {
    
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
    
    static func createTitleView(withSize size: CGRect, titleText: String) -> UIView {
        {
            $0.addSubview(AppUI.createLabel(
                withSize: CGRect(x: 0, y: 0, width: $0.frame.width, height: 40),
                text: titleText, textColor: .white, textAlignment: .center,
                fontSize: 34, fontWeight: .bold))
            return $0
        }(UIView(frame: size))
    }
    
    static func createButton(withSize size: CGRect, titleText: String, titleColor: UIColor, bgColor: UIColor, action: UIAction) -> UIButton {
        {
            $0.backgroundColor = bgColor
            $0.layer.cornerRadius = 15
            $0.setTitle(titleText, for: .normal)
            $0.setTitleColor(titleColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.addAction(action, for: .touchDown)
            return $0
        }(UIButton(frame: size))
    }
}
