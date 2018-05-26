import UIKit

class DetailVC: UIViewController {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var statusBarHeight:CGFloat!
    var navigationBarHeight:CGFloat!
    var tabBarHeight:CGFloat!
    
    private var titleTextField: UITextField!
    private var  startBtn:UIButton!
    private var  endBtn:UIButton!
    private var  editMenuBtn:UIButton!
    
    private var menuNameLabel:UILabel!
    private var menuDescriptionLabel:UILabel!
    
    private var  saveBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Viewの大きさを取得
        //let viewWidth = self.view.frame.size.width
        //let viewHeight = self.view.frame.size.height

        self.title = "メニュー"
        self.view.backgroundColor = UIColor.init(named: "BGGray")
        
        //Viewの大きさを取得
        viewWidth = self.view.frame.size.width
        viewHeight = self.view.frame.size.height
        statusBarHeight = (self.navigationController?.navigationBar.frame.origin.y)!
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        tabBarHeight = (self.tabBarController?.tabBar.frame.size.height)!
        
        let title = UILabel()
        title.text = "目標名"
        title.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 20, width: viewWidth, height: 20)
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = NSTextAlignment.left
        title.textColor = UIColor.init(named: "MainGray")
        self.view.addSubview(title)
        
        let titleLabel = UILabel()
        titleLabel.text = "一週間でフルマラソン"
        titleLabel.textColor = UIColor.init(named: "MainGray")
        titleLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 52, width: viewWidth - 64, height: 16)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(titleLabel)
        
        let term = UILabel()
        term.text = "期間"
        term.textColor = UIColor.init(named: "MainGray")
        term.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 88, width: viewWidth, height: 20)
        term.font = UIFont.boldSystemFont(ofSize: 20)
        term.textAlignment = NSTextAlignment.left
        self.view.addSubview(term)
        
        let termLabel = UILabel()
        termLabel.text = "2018/05/07-2018/06/07"
        termLabel.textColor = UIColor.init(named: "MainGray")
        termLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 120, width: viewWidth - 64, height: 16)
        termLabel.font = UIFont.boldSystemFont(ofSize: 16)
        termLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(termLabel)
        
        let menu = UILabel()
        menu.text = "メニュー"
        menu.textColor = UIColor.init(named: "MainGray")
        menu.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 156, width: viewWidth, height: 20)
        menu.font = UIFont.boldSystemFont(ofSize: 20)
        menu.textAlignment = NSTextAlignment.left
        self.view.addSubview(menu)
        
        //メニューの名前
        let menuNameLabel = UILabel()
        menuNameLabel.text = "ランニング"
        menuNameLabel.textColor = UIColor.init(named: "MainGray")
        menuNameLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 188, width: (viewWidth - 64)/2, height: 16)
        menuNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuNameLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(menuNameLabel)
        
        //メニューの詳細
        let menuDescriptionLabel = UILabel()
        menuDescriptionLabel.text = "10 Km"
        menuDescriptionLabel.textColor = UIColor.init(named: "MainGray")
        menuDescriptionLabel.frame = CGRect(x: viewWidth/2, y: statusBarHeight + navigationBarHeight + 188, width: (viewWidth - 64)/2, height: 16)
        menuDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescriptionLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(menuDescriptionLabel)
        
        
        let protein = UILabel()
        protein.text = "プロテイン"
        protein.textColor = UIColor.init(named: "MainGray")
        protein.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 224, width: viewWidth, height: 20)
        protein.font = UIFont.boldSystemFont(ofSize: 20)
        protein.textAlignment = NSTextAlignment.left
        self.view.addSubview(protein)
        
        
        
        let pi = CGFloat(Double.pi)
        let start:CGFloat = pi * 1.5 // 開始の角度
        let end :CGFloat = pi * 1.0// 終了の角度
        
        let path: UIBezierPath = UIBezierPath();
        path.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2))
        path.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2), radius: 100, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orange.cgColor
        layer.path = path.cgPath
        
        
        
        
        
        
        //self.view.layer.addSublayer(layer)
        
    }


}
