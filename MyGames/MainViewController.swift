
import UIKit
let windowWidth:CGFloat = UIScreen.main.bounds.width
let windowHeight:CGFloat = UIScreen.main.bounds.height

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
     
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "tic tac toy"
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.textColor = .black
        case 1:
            cell.textLabel?.text = "2048"
            cell.accessoryType = .disclosureIndicator
        case 2:
            cell.textLabel?.text = "15x1"
            cell.accessoryType = .disclosureIndicator
        default :return UITableViewCell(frame: .zero)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            navigationController?.pushViewController(TicTacToeViewController(), animated: true)
        case 1:navigationController?.pushViewController(TwentyViewController(), animated: true)
        case 2:navigationController?.pushViewController(fifteenXOneViewController(), animated: true)
        default: print("wrong")
        }
       
        
    }
}
