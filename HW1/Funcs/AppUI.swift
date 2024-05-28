import Foundation
import UIKit

final class AppUI {
    
    static func createTitleView(withSize size: CGRect, titleText: String, font: UIFont) -> UIView {
        {
            $0.addSubview(AppUI.createLabel(
                withSize: CGRect(x: 0, y: 0, width: $0.frame.width, height: 40),
                text: titleText, textColor: .white, textAlignment: .center,
                font: font))
            return $0
        }(UIView(frame: size))
    }
    
    static func createLabel(withSize size: CGRect, text: String, textColor: UIColor, textAlignment: NSTextAlignment, font: UIFont) -> UILabel {
        {
            $0.text = text
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.font = font
            $0.numberOfLines = 0
            return $0
        }(UILabel(frame: size))
    }
    
    static func createTextField(withSize size: CGRect, font: UIFont) -> UITextField {
        {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
            $0.leftView = leftView
            $0.leftViewMode = .always
            $0.font = font
            return $0
        }(UITextField(frame: size))
    }
    
    static func createButton(withSize size: CGRect, titleText: String, titleColor: UIColor, bgColor: UIColor, action: UIAction, font: UIFont) -> UIButton {
        {
            $0.backgroundColor = bgColor
            $0.layer.cornerRadius = 15
            $0.setTitle(titleText, for: .normal)
            $0.setTitleColor(titleColor, for: .normal)
            $0.titleLabel?.font = font
            $0.addAction(action, for: .touchDown)
            return $0
        }(UIButton(frame: size))
    }
    
    static func createImageView(withSize size: CGRect, image: String) -> UIImageView {
        {
            $0.image = UIImage(named: image)
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            return $0
        }(UIImageView(frame: size))
    }
    
    static func createProfileButton(image: String, text: String, font: UIFont) -> UIButton {
        let btnConfig : UIButton.Configuration = {
            return $0
        }(UIButton.Configuration.plain())
        
        return {
            $0.backgroundColor = .appProfileCell
            $0.layer.cornerRadius = 5
            $0.contentHorizontalAlignment = .leading
            $0.setImage(UIImage(systemName: image), for: .normal)
            $0.setTitle(text, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.tintColor = .white
            $0.configuration?.imagePlacement = .leading
            $0.configuration?.imagePadding = 27
            $0.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = font
                return outgoing
            }
            return $0
        }(UIButton(configuration: btnConfig, primaryAction: UIAction(handler: { _ in
            print("Открыть \(text)")
        })))
    }
}
