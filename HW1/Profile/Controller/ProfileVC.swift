import UIKit

final class ProfileVC: UIViewController {
    
    private lazy var screenRatio = view.frame.height / 932

    private lazy var myProfileLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: 20, y: 40, width: 240, height: 85),
        text: "Мой профиль", textColor: .white, textAlignment: .center,
        fontSize: 35, fontWeight: .bold)
    
    private lazy var profileImageView : UIImageView = {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 75
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.white.cgColor
        $0.image = .profile
        $0.center.x = view.center.x
        return $0
    }(UIImageView(frame: CGRect(x: .zero, y: 240 * screenRatio, width: 150, height: 150)))
    
    private lazy var emailLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: 30, y: profileImageView.frame.maxY + 50, width: view.frame.width - 60, height: 30),
        text: Service.shared.email, textColor: .white, textAlignment: .center,
        fontSize: 28, fontWeight: .bold)
    
    // TODO: сделать, чтобы это было кнопкой
    
    // private lazy var myAccountView : UIView = AppUI.createView(withBGColor: .appProfileCell, cornerRadius: 5)
    
    private lazy var myAccountButton : UIButton = AppUI.createProfileButton(image: "user", text: "Мой аккаунт")
    
    private lazy var settingsButton : UIButton = AppUI.createProfileButton(image: "user", text: "Настройки")
    // "gearshape"
    
    private lazy var helpButton : UIButton = AppUI.createProfileButton(image: "user", text: "Помощь")
    // "ellipsis.message"
    
    private lazy var stackView : UIStackView = { st in
        st.axis = .vertical
        st.spacing = 10
        st.alignment = .fill
        st.distribution = .fillEqually
        st.backgroundColor = .gray
        [myAccountButton, settingsButton, helpButton].forEach { st.addArrangedSubview($0) }
        return st
    }(UIStackView(frame: CGRect(x: 70, y: emailLabel.frame.maxY + 40, width: view.frame.width - 140, height: 152)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        [myProfileLabel, profileImageView, emailLabel, stackView].forEach { view.addSubview($0) }
    }
}
