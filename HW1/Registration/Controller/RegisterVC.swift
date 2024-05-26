import UIKit

final class RegisterVC: UIViewController, VCProtocol {
    
    private lazy var screenRatio = view.frame.width / view.frame.height
    
    private lazy var titleView : UIView = AppUI.createView(withSize: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 65), bgColor: .clear, cornerRadius: 0)
    
    private lazy var titleLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: 0, y: 0, width: titleView.frame.width, height: 42),
        text: "Регистрация", textColor: .white, textAlignment: .center,
        fontSize: 34, fontWeight: .bold)

    private let tableData : [RegisterItem] = RegisterItem.getMockData()
    
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
    
    internal lazy var bigButton: UIButton = {
        $0.backgroundColor = .appPurple
        $0.layer.cornerRadius = 15
        $0.setTitle("Регистрация", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UIButton(frame: CGRect(x: privacyLabel.frame.minX, y: privacyLabel.frame.maxY + 50, width: privacyLabel.frame.width, height: 70), primaryAction: UIAction(handler: { _ in
        if Service.shared.nickName != "user" && Service.shared.email != "ivanIvanov@gmail.com" && Service.shared.password != "admin" {
            NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
        } else {
            print("Incorrect Registration Data! Please fill all the poles or change your data!")
        }
    })))
    
    internal lazy var accountlabel: UILabel = AppUI.createLabel(
        withSize: CGRect(x: 100 * screenRatio, y: bigButton.frame.maxY + 30, width: 170, height: 28),
        text: "Уже есть аккаунт?", textColor: .appGray, textAlignment: .center,
        fontSize: 18, fontWeight: .regular)
    
    internal lazy var smallButton: UIButton = {
        $0.setTitle("ВОЙТИ", for: .normal)
        $0.setTitleColor(.appPurple, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.backgroundColor = .clear
        return $0
    }(UIButton(frame: CGRect(x: accountlabel.frame.maxX + 10, y: accountlabel.frame.minY, width: 60, height: accountlabel.frame.height), primaryAction: UIAction(handler: { _ in
        NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        titleView.addSubview(titleLabel)
        [tableView, privacyLabel, bigButton, accountlabel, smallButton].forEach { view.addSubview($0) }
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

