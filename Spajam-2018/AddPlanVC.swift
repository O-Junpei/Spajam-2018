import UIKit

class AddPlanVC: UIViewController, UITextFieldDelegate {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var statusBarHeight:CGFloat!
    var navigationBarHeight:CGFloat!
    var tabBarHeight:CGFloat!
    
    private var nameTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "目標設定"
        self.view.backgroundColor = .white
        
        //Viewの大きさを取得
        viewWidth = self.view.frame.size.width
        viewHeight = self.view.frame.size.height
        statusBarHeight = (self.navigationController?.navigationBar.frame.origin.y)!
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        tabBarHeight = (self.tabBarController?.tabBar.frame.size.height)!
        
        let name = UILabel()
        name.text = "目標名"
        name.frame = CGRect(x: 0, y: statusBarHeight + navigationBarHeight, width: viewWidth, height: 20)
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = NSTextAlignment.left
        self.view.addSubview(name)
        
        // UITextFieldの作成
        nameTextField = UITextField()
        nameTextField.frame = CGRect(x: 50, y: statusBarHeight + navigationBarHeight + 40, width: 200, height: 50)
        nameTextField.text = "myTextField"
        nameTextField.delegate = self
        nameTextField.borderStyle = UITextBorderStyle.roundedRect
        nameTextField.clearButtonMode = .whileEditing
        self.view.addSubview(nameTextField)
        
        let term = UILabel()
        term.text = "期間"
        term.frame = CGRect(x: 0, y: statusBarHeight + navigationBarHeight + 80, width: viewWidth, height: 20)
        term.font = UIFont.boldSystemFont(ofSize: 20)
        term.textAlignment = NSTextAlignment.left
        self.view.addSubview(term)
        
        
        
        
        let menu = UILabel()
        menu.text = "メニュー"
        menu.frame = CGRect(x: 0, y: statusBarHeight + navigationBarHeight + 160, width: viewWidth, height: 20)
        menu.font = UIFont.boldSystemFont(ofSize: 20)
        menu.textAlignment = NSTextAlignment.left
        self.view.addSubview(menu)
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

}
