import UIKit

class SelfManagementVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "自己管理"
        self.view.backgroundColor = UIColor.init(named: "BGGray")
        
        let label = UILabel()
        label.text = "未実装( ；∀；)"
        label.frame = self.view.frame
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        self.view.addSubview(label)
        
    }

}
