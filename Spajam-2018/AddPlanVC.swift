import UIKit

class AddPlanVC: UIViewController, UITextFieldDelegate, AddMuneDelegate {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var statusBarHeight:CGFloat!
    var navigationBarHeight:CGFloat!
    var tabBarHeight:CGFloat!
    
    private var titleTextField: UITextField!
    private var  startBtn:UIButton!
    private var  endtBtn:UIButton!
    private var  editMenuBtn:UIButton!

    private var menuNameLabel:UILabel!
    private var menuDescriptionLabel:UILabel!
    
    private var  saveBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "目標設定"
        self.view.backgroundColor = UIColor.init(named: "BGGray")
        
        //Viewの大きさを取得
        viewWidth = self.view.frame.size.width
        viewHeight = self.view.frame.size.height
        statusBarHeight = (self.navigationController?.navigationBar.frame.origin.y)!
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        tabBarHeight = (self.tabBarController?.tabBar.frame.size.height)!
        
        let name = UILabel()
        name.text = "目標名"
        name.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 20, width: viewWidth, height: 20)
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = NSTextAlignment.left
        name.textColor = UIColor.init(named: "MainGray")
        self.view.addSubview(name)
        
        // UITextFieldの作成
        titleTextField = UITextField()
        titleTextField.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 48, width: viewWidth - 32 * 2, height: 40)
        titleTextField.text = ""
        titleTextField.delegate = self
        titleTextField.borderStyle = UITextBorderStyle.roundedRect
        titleTextField.clearButtonMode = .whileEditing
        self.view.addSubview(titleTextField)
        
        let term = UILabel()
        term.text = "期間"
        term.textColor = UIColor.init(named: "MainGray")
        term.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 112, width: viewWidth, height: 20)
        term.font = UIFont.boldSystemFont(ofSize: 20)
        term.textAlignment = NSTextAlignment.left
        self.view.addSubview(term)
        
        //スタート
        startBtn = UIButton()
        startBtn.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 140, width: (viewWidth - 64)/2 - 2 , height: 40)
        startBtn.backgroundColor = UIColor.gray
        startBtn.addTarget(self, action: #selector(startBtnClicked(sender:)), for:.touchUpInside)
        startBtn.setTitle("2018/05/06", for: UIControlState.normal)
        startBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        startBtn.layer.masksToBounds = true
        startBtn.layer.cornerRadius = 4.0
        self.view.addSubview(startBtn)
        
        //エンド
        endtBtn = UIButton()
        endtBtn.frame = CGRect(x: viewWidth/2 + 2, y: statusBarHeight + navigationBarHeight + 140, width: (viewWidth - 64)/2 - 2, height: 40)
        endtBtn.backgroundColor = UIColor.gray
        endtBtn.addTarget(self, action: #selector(endBtnClicked(sender:)), for:.touchUpInside)
        endtBtn.setTitle("2018/05/06", for: UIControlState.normal)
        endtBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        endtBtn.layer.masksToBounds = true
        endtBtn.layer.cornerRadius = 4.0
        self.view.addSubview(endtBtn)
        
        let menu = UILabel()
        menu.text = "メニュー"
        menu.textColor = UIColor.init(named: "MainGray")
        menu.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 200, width: viewWidth, height: 20)
        menu.font = UIFont.boldSystemFont(ofSize: 20)
        menu.textAlignment = NSTextAlignment.left
        self.view.addSubview(menu)
        
        //メニューの編集
        editMenuBtn = UIButton()
        editMenuBtn.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 228, width: viewWidth - 64, height: 40)
        editMenuBtn.backgroundColor = UIColor.gray
        editMenuBtn.addTarget(self, action: #selector(menuBtnClicked(sender:)), for:.touchUpInside)
        editMenuBtn.setTitle("メニューを編集する", for: UIControlState.normal)
        editMenuBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        editMenuBtn.layer.masksToBounds = true
        editMenuBtn.layer.cornerRadius = 4.0
        self.view.addSubview(editMenuBtn)
        
        //メニューの名前
        menuNameLabel = UILabel()
        menuNameLabel.text = "ランニング"
        menuNameLabel.textColor = UIColor.init(named: "MainGray")
        menuNameLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 280, width: (viewWidth - 64)/2, height: 16)
        menuNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuNameLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(menuNameLabel)
        
        //メニューの詳細
        menuDescriptionLabel = UILabel()
        menuDescriptionLabel.text = "10 Km"
        menuDescriptionLabel.textColor = UIColor.init(named: "MainGray")
        menuDescriptionLabel.frame = CGRect(x: viewWidth/2, y: statusBarHeight + navigationBarHeight + 280, width: (viewWidth - 64)/2, height: 16)
        menuDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescriptionLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(menuDescriptionLabel)
        
        //セーブボタン
        saveBtn = UIButton()
        saveBtn.frame = CGRect(x: 32, y: viewHeight - (statusBarHeight + navigationBarHeight + tabBarHeight), width: (viewWidth - 64), height: 40)
        saveBtn.backgroundColor = UIColor.init(named: "MainPink")
        saveBtn.addTarget(self, action: #selector(endBtnClicked(sender:)), for:.touchUpInside)
        saveBtn.setTitle("保存する", for: UIControlState.normal)
        saveBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        saveBtn.layer.masksToBounds = true
        saveBtn.layer.cornerRadius = 4.0
        self.view.addSubview(saveBtn)
        
    }
    
    //UITextFieldが編集された前に呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    //UITextFieldが編集された後に呼ばれる
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    //改行ボタンが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \(textField.text!)")
        
        // 改行ボタンが押されたらKeyboardを閉じる処理.
        textField.resignFirstResponder()
        return true
    }
    
    //startボタンが押されたら呼ばれる
    @objc internal func startBtnClicked(sender: UIButton){
        print("cornerCircleButtonBtnClicked")
    }
    
    //endボタンが押されたら呼ばれる
    @objc internal func endBtnClicked(sender: UIButton){
        print("cornerCircleButtonBtnClicked")
    }
    
    //menuボタンが押されたら呼ばれる
    @objc internal func menuBtnClicked(sender: UIButton){
        let addPlanListVC:AddPlanListVC = AddPlanListVC()
        addPlanListVC.delegate = self
        self.navigationController?.pushViewController(addPlanListVC, animated: true)
    }

    //Delegateで呼ぶViewの背景色を変えるメソッド
    func addMenu(menu:String, description:String){
        menuNameLabel.text = menu
        menuDescriptionLabel.text = description
    }
    
}
