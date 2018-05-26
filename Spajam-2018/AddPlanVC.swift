import UIKit
import SwiftyJSON
import Alamofire
import SCLAlertView

class AddPlanVC: UIViewController, UITextFieldDelegate, AddMuneDelegate, DatePickerDelegate {
    
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
        startBtn.setTitle("2018/05/26", for: UIControlState.normal)
        startBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        startBtn.layer.masksToBounds = true
        startBtn.layer.cornerRadius = 4.0
        self.view.addSubview(startBtn)
        
        //エンド
        endBtn = UIButton()
        endBtn.frame = CGRect(x: viewWidth/2 + 2, y: statusBarHeight + navigationBarHeight + 140, width: (viewWidth - 64)/2 - 2, height: 40)
        endBtn.backgroundColor = UIColor.gray
        endBtn.addTarget(self, action: #selector(endBtnClicked(sender:)), for:.touchUpInside)
        endBtn.setTitle("2018/05/27", for: UIControlState.normal)
        endBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        endBtn.layer.masksToBounds = true
        endBtn.layer.cornerRadius = 4.0
        self.view.addSubview(endBtn)
        
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
        menuNameLabel.text = ""
        menuNameLabel.textColor = UIColor.init(named: "MainGray")
        menuNameLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 280, width: (viewWidth - 64)/2, height: 16)
        menuNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuNameLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(menuNameLabel)
        
        //メニューの詳細
        menuDescriptionLabel = UILabel()
        menuDescriptionLabel.text = ""
        menuDescriptionLabel.textColor = UIColor.init(named: "MainGray")
        menuDescriptionLabel.frame = CGRect(x: viewWidth/2, y: statusBarHeight + navigationBarHeight + 280, width: (viewWidth - 64)/2, height: 16)
        menuDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescriptionLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(menuDescriptionLabel)
        
        //セーブボタン
        saveBtn = UIButton()
        saveBtn.frame = CGRect(x: 32, y: viewHeight - (statusBarHeight + navigationBarHeight + tabBarHeight), width: (viewWidth - 64), height: 40)
        saveBtn.backgroundColor = UIColor.init(named: "MainPink")
        saveBtn.addTarget(self, action: #selector(saveBtnClicked(sender:)), for:.touchUpInside)
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
        
        var year:String = "2018"
        var month:String = "06"
        var day:String = "25"
        if let date = sender.titleLabel?.text {
            let split = date.components(separatedBy: "/")
            year = split[0]
            month = split[1]
            day = split[2]
        }
        let addPlanDateVC:AddPlanDateVC = AddPlanDateVC()
        addPlanDateVC.delegate = self
        addPlanDateVC.isStart = true
        addPlanDateVC.tabBarHeight = tabBarHeight
        addPlanDateVC.year = year
        addPlanDateVC.month = month
        addPlanDateVC.day = day
        addPlanDateVC.modalPresentationStyle = .overCurrentContext
        present(addPlanDateVC, animated: true, completion: nil)
    }
    
    //Delegateで呼ぶViewの背景色を変えるメソッド
    func editStartBtn(year:String, month:String, day:String){
        startBtn.setTitle(year+"/"+month+"/"+day, for: UIControlState.normal)
    }
    
    //endボタンが押されたら呼ばれる
    @objc internal func endBtnClicked(sender: UIButton){
        var year:String = "2018"
        var month:String = "06"
        var day:String = "25"
        if let date = sender.titleLabel?.text {
            let split = date.components(separatedBy: "/")
            year = split[0]
            month = split[1]
            day = split[2]
        }
        let addPlanDateVC:AddPlanDateVC = AddPlanDateVC()
        addPlanDateVC.delegate = self
        addPlanDateVC.isStart = false
        addPlanDateVC.tabBarHeight = tabBarHeight
        addPlanDateVC.year = year
        addPlanDateVC.month = month
        addPlanDateVC.day = day
        addPlanDateVC.modalPresentationStyle = .overCurrentContext
        present(addPlanDateVC, animated: true, completion: nil)
    }
    
    func editEndBtn(year:String, month:String, day:String){
        endBtn.setTitle(year+"/"+month+"/"+day, for: UIControlState.normal)
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
    
    //saveボタンが押されたら呼ばれる
    @objc internal func saveBtnClicked(sender: UIButton){
        //indicatrer
        
        var title:String = ""
        var start:String = ""
        var end:String = ""
        var menu:String = ""

        if !(titleTextField.text?.isEmpty)! {
            title = titleTextField.text!
        } else {
            SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
            return
        }
        
        if !((startBtn.titleLabel?.text?.isEmpty)!) {
            start = (startBtn.titleLabel?.text!)!
            if start.contains("/") {
                start = start.replacingOccurrences(of:"/", with:"-")
            } else {
                SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
                return
            }
        } else {
            SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
            return
        }
        
        if !((endBtn.titleLabel?.text?.isEmpty)!) {
            end = (endBtn.titleLabel?.text!)!
            if end.contains("/") {
                end = end.replacingOccurrences(of:"/", with:"-")
            } else {
                SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
                return
            }
        } else {
            SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
            return
        }
        
        if (menuNameLabel.text?.isEmpty)! || (menuDescriptionLabel.text?.isEmpty)! {
            SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
            return
        } else {
            menu = menuNameLabel.text! + "-" +  menuDescriptionLabel.text!
        }
        
        let parameters: Parameters = [
            "id": 1,
            "title": title,
            "start": start,
            "end": end,
            "menu": menu,
        ]
        
        Alamofire.request("http://spajam2018-rails-server.herokuapp.com/api/v0/objective", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            
            switch response.result {
            case .success:
                
                let json:JSON = JSON(response.result.value ?? kill)
                if json["is_success"].boolValue {
                    SCLAlertView().showSuccess("Completed", subTitle: "目標を投稿しました") //
                } else {
                    SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
                }
                
            case .failure(let error):
                SCLAlertView().showError("Error", subTitle: "投稿に失敗しました") // Warning
                print(error)
            }
        }
    }
    
}
