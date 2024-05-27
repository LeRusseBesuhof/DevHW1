import UIKit

final class RegisterVC: UIViewController, VCProtocol {
    
    private lazy var screenRatio = view.frame.width / view.frame.height
    
    private lazy var titleView : UIView = AppUI.createTitleView(withSize: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 65), titleText: "Регистрация")

    private let tableData : [TableItem] = TableItem.getMockRegisterData()
    
    internal lazy var tableView : UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(RegisterCell.self, forCellReuseIdentifier: RegisterCell.reuseID)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: CGRect(x: 25, y: 343 * screenRatio, width: view.frame.width - 50, height: 330)))
    
    private lazy var privacyLabel = AppUI.createLabel(
        withSize: CGRect(x: tableView.frame.minX, y: tableView.frame.maxY + 15, width: tableView.frame.width, height: 35),
        text: "Я согласен с Условиями предоставления услуг и Политикой конфиденциальности",
        textColor: .appGray, textAlignment: .left,
        fontSize: 14, fontWeight: .regular)
    
    private lazy var bigButtonAction : UIAction = UIAction { _ in
        if !Service.shared.nickName.isEmpty, !Service.shared.email.isEmpty, !Service.shared.password.isEmpty {
            NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
        } else {
            print("Incorrect Registration Data! Please fill all text fields!")
        }
    }
    
    internal lazy var bigButton: UIButton = AppUI.createButton(
        withSize: CGRect(x: privacyLabel.frame.minX, y: privacyLabel.frame.maxY + 50, width: privacyLabel.frame.width, height: 70),
        titleText: "РЕГИСТРАЦИЯ", titleColor: .white, bgColor: .appPurple, action: bigButtonAction)
    
    internal lazy var accountlabel: UILabel = AppUI.createLabel(
        withSize: CGRect(x: 100 * screenRatio, y: bigButton.frame.maxY + 30, width: 170, height: 28),
        text: "Уже есть аккаунт?", textColor: .appGray, textAlignment: .center,
        fontSize: 18, fontWeight: .regular)
    
    private lazy var smallButtonAction : UIAction = UIAction { _ in
        NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
    }
    
    internal lazy var smallButton: UIButton = AppUI.createButton(
        withSize: CGRect(x: accountlabel.frame.maxX + 10, y: accountlabel.frame.minY + 1, width: 60, height: accountlabel.frame.height),
        titleText: "ВОЙТИ", titleColor: .appPurple, bgColor: .clear, action: smallButtonAction)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        [tableView, privacyLabel, bigButton, accountlabel, smallButton].forEach { view.addSubview($0) }
    }
    
    @objc func passwordShowMode(sender: UIButton) {
        // print(Service.shared.nickName, Service.shared.email, Service.shared.password)
        if Service.shared.nickName != "user" && Service.shared.email != "ivanIvanov@gmail.com" && Service.shared.password != "admin" {
            NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
        } else {
            print("Incorrect Registration Data! Please fill all the poles or change your data!")
        }
    }
}

extension RegisterVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.reuseID, for: indexPath) as? RegisterCell else { return UITableViewCell() }
        cell.setUpCell(with: item, row: indexPath.row)
        return cell
    }
    
}

extension RegisterVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 85 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { titleView }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 65 }
}

