import UIKit

final class ProfileVC: UIViewController {
    
    private lazy var screenRatio = view.frame.height / 932

    private lazy var myProfileLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 85),
        text: "Мой профиль", textColor: .white, textAlignment: .left,
        font: UIFont.getComfortaaFont(fontType: .bold, fontSize: 34))
    
    private lazy var profileImageView : UIImageView = {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 75
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.image = .profile
        $0.center.x = view.center.x
        return $0
    }(UIImageView(frame: CGRect(x: .zero, y: 240 * screenRatio, width: 150, height: 150)))
    
    private lazy var emailLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: 30, y: profileImageView.frame.maxY + 50, width: view.frame.width - 60, height: 30),
        text: Service.shared.email, textColor: .white, textAlignment: .center,
        font: UIFont.getComfortaaFont(fontType: .bold, fontSize: 28))
    
    private lazy var myAccountButton : UIButton = AppUI.createProfileButton(image: "person", text: "Мой аккаунт", font: UIFont.getComfortaaFont())
    
    private lazy var settingsButton : UIButton = AppUI.createProfileButton(image: "gearshape", text: "Настройки", font: UIFont.getComfortaaFont())
    
    private lazy var helpButton : UIButton = AppUI.createProfileButton(image: "ellipsis.message", text: "Помощь", font: UIFont.getComfortaaFont())
    
    private lazy var stackView : UIStackView = { st in
        st.axis = .vertical
        st.spacing = 10
        st.alignment = .fill
        st.distribution = .fillEqually
        [myAccountButton, settingsButton, helpButton].forEach { st.addArrangedSubview($0) }
        return st
    }(UIStackView(frame: CGRect(x: 70, y: emailLabel.frame.maxY + 40, width: view.frame.width - 140, height: 152)))
    
    private lazy var exitButton : UIButton = {
        $0.backgroundColor = .appProfileCell
        $0.layer.cornerRadius = 5
        $0.tintColor = .white
        $0.setTitle("Выход", for: .normal)
        $0.titleLabel?.font = UIFont.getComfortaaFont()
        return $0
    }(UIButton(
        frame: CGRect(x: stackView.frame.minX, y: stackView.frame.maxY + 150 * screenRatio, width: stackView.frame.width, height: 44),
        primaryAction: UIAction(handler: { _ in
            NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
        })
    ))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        [myProfileLabel, profileImageView, emailLabel, stackView, exitButton].forEach { view.addSubview($0) }
    }
}
