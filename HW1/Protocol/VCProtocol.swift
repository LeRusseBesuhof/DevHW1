import Foundation
import UIKit

protocol VCProtocol : AnyObject {
    var tableView : UITableView { get set }
    var bigButton : UIButton { get }
    var accountlabel : UILabel { get }
    var smallButton : UIButton { get }
}
