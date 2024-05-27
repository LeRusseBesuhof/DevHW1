import UIKit

final class EnterVC: UIViewController, VCProtocol {
    
    private lazy var screenRatio = view.frame.width / view.frame.height
    
    private lazy var titleView : UIView = AppUI.createTitleView(withSize: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 65), titleText: "Войти")
    
    private let tableData : [TableItem] = TableItem.getMockEnterData()
    
    internal lazy var tableView : UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(EnterCell.self, forCellReuseIdentifier: EnterCell.reuseID)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: CGRect(x: 25, y: 386 * screenRatio, width: view.frame.width - 50, height: 245)))
    
    private lazy var wrongDataLabel : UILabel = AppUI.createLabel(
        withSize: CGRect(x: tableView.frame.minX, y: tableView.frame.maxY, width: tableView.frame.width, height: 20),
        text: "", textColor: .red, textAlignment: .left,
        fontSize: 14, fontWeight: .regular)
    
    private lazy var bigButtonAction : UIAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        let result = PasswordActor.checkData(nickName: EnterCell.currentNickName, password: EnterCell.currentPassword)
        if result {
            NotificationCenter.default.post(Notification(name: Notification.Name(.setProfileRoot)))
        } else {
            EnterCell.currentNickName = ""
            EnterCell.currentNickName = ""
            wrongDataLabel.text = "Неверный адрес почты или пароль!"
            view.addSubview(wrongDataLabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                NotificationCenter.default.post(Notification(name: Notification.Name(.setEnterRoot)))
            }
        }
    }
    
    internal lazy var bigButton: UIButton = AppUI.createButton(
        withSize: CGRect(x: tableView.frame.minX, y: tableView.frame.maxY + 35, width: tableView.frame.width, height: 70),
        titleText: "ВОЙТИ", titleColor: .white, bgColor: .appPurple, action: bigButtonAction)
    
    internal lazy var accountlabel: UILabel = AppUI.createLabel(
        withSize: CGRect(x: 60 * screenRatio, y: bigButton.frame.maxY + 30, width: 170, height: 28),
        text: "У вас нет аккаунта?", textColor: .appGray, textAlignment: .center,
        fontSize: 18, fontWeight: .regular)
    
    private lazy var smallButtonAction : UIAction = UIAction { _ in
        NotificationCenter.default.post(Notification(name: Notification.Name(.setRegisterRoot)))
    }
    
    internal lazy var smallButton: UIButton = AppUI.createButton(
        withSize: CGRect(x: accountlabel.frame.maxX + 10, y: accountlabel.frame.minY + 1, width: 130, height: accountlabel.frame.height),
        titleText: "РЕГИСТРАЦИЯ", titleColor: .appPurple, bgColor: .clear, action: smallButtonAction)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        [tableView, bigButton, accountlabel, smallButton].forEach { view.addSubview($0) }
    }
}

extension EnterVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EnterCell.reuseID, for: indexPath) as? EnterCell else { return UITableViewCell() }
        cell.setUpCell(with: item, row: indexPath.row)
        return cell
    }
}

extension EnterVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 85 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { titleView }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 65 }
}
