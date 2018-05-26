import UIKit

class MyPageVC: UIViewController {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var statusBarHeight:CGFloat!
    var navigationBarHeight:CGFloat!
    var tabBarHeight:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "マイページ"
        self.view.backgroundColor = UIColor.init(named: "BGGray")

        //Viewの大きさを取得
        viewWidth = self.view.frame.size.width
        viewHeight = self.view.frame.size.height
        statusBarHeight = (self.navigationController?.navigationBar.frame.origin.y)!
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        tabBarHeight = (self.tabBarController?.tabBar.frame.size.height)!
        
        let title = UILabel()
        title.text = "あなたの持つプロテイン"
        title.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 20, width: viewWidth-64, height: 20)
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = NSTextAlignment.left
        title.textColor = UIColor.init(named: "MainGray")
        self.view.addSubview(title)
        
        let titleLabel = UILabel()
        titleLabel.text = "102個"
        titleLabel.textColor = UIColor.init(named: "MainGray")
        titleLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 52, width: viewWidth - 64, height: 16)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(titleLabel)
        
    }
}
