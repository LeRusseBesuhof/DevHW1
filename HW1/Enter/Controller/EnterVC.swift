import UIKit

final class EnterVC: UIViewController, VCProtocol {
    
    private lazy var screenRatio = view.frame.width / view.frame.height
    
    private lazy var titleView : UIView = AppUI.createTitleView(withSize: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 65), titleText: "Войти")
    
    private let tableData : [TableItem] = TableItem.getMockEnterData()
    
    internal lazy var tableView : UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseID)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: CGRect(x: 25, y: 386 * screenRatio, width: view.frame.width - 50, height: 245)))
    
    private lazy var bigButtonAction : UIAction = UIAction { _ in
        //
    }
    
    internal lazy var bigButton: UIButton = AppUI.createButton(
        withSize: CGRect(x: tableView.frame.minX, y: tableView.frame.maxY + 35, width: tableView.frame.width, height: 70),
        titleText: "ВОЙТИ", titleColor: .white, bgColor: .appPurple, action: bigButtonAction)
    
    internal lazy var accountlabel: UILabel = {
        return $0
    }(UILabel())
    
    internal lazy var smallButton: UIButton = {
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        [tableView].forEach { view.addSubview($0) }
    }
}

extension EnterVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseID, for: indexPath) as? TableCell else { return UITableViewCell() }
        cell.setUpCell(with: item, row: indexPath.row)
        return cell
    }
}

extension EnterVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 85 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { titleView }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 65 }
}
