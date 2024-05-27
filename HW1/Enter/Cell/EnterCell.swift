import UIKit

final class EnterCell: UITableViewCell, CellProtocol {
    
    static internal let reuseID: String = "enter"

    private lazy var canvasView : UIView = UIView(frame: frame)
    
    private lazy var textField : UITextField = AppUI.createTextField(withSize: CGRect(x: 0, y: 0, width: canvasView.frame.width, height: 70))
    
    static var currentNickName = ""
    static var currentPassword = ""
    
    private var hiddenFlag = true
    
    func setUpCell(with item: TableItem, row: Int) {
        selectionStyle = .none
        backgroundColor = .clear
        
        textField.tag = row
        textField.placeholder = item.textField
        textField.addTarget(self, action: #selector(textFieldDidChanged(textField: )), for: .editingChanged)
        if item.textField == "Пароль" {
            let rightView = UIView(frame: CGRect(x: textField.frame.maxX - 55, y: 0, width: 55, height: textField.frame.height))
            let btn : UIButton = {
                $0.setImage(UIImage(systemName: "eye.fill"), for: .normal)
                $0.tintColor = .appGray
                $0.addTarget(self, action: #selector(changeHiddenFlagState(sender: )), for: .touchDown)
                return $0
            }(UIButton(frame: CGRect(x: 0, y: 27, width: 25, height: 16)))
            rightView.addSubview(btn)
            textField.rightView = rightView
            textField.rightViewMode = .always
        }
        addSubview(textField)
    }
    
    @objc func changeHiddenFlagState(sender: UIButton) {
        hiddenFlag ? sender.setImage(UIImage(systemName: "eye"), for: .normal) : sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        hiddenFlag = !hiddenFlag
    }
    
    @objc func textFieldDidChanged(textField: UITextField) {
        if let text = textField.text {
            if textField.tag == 0 {
                EnterCell.currentNickName = text
            } else {
                EnterCell.currentPassword += String(text.last!)
                textField.text! = hiddenFlag ? PasswordActor.encrypt(text: textField.text!) : EnterCell.currentPassword
                Service.shared.password = EnterCell.currentPassword
            }
        }
    }
}
