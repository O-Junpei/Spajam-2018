import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON
import UserNotifications

class DetailVC: UIViewController {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var statusBarHeight:CGFloat!
    var navigationBarHeight:CGFloat!
    var tabBarHeight:CGFloat!
    
    
    var titleStr:String!
    var dateStr:String!
    var achievement:Int!
    var menuTitleStr:String!
    var menuDetailStr:String!

    
    private var titleTextField: UITextField!
    private var  startBtn:UIButton!
    private var  endBtn:UIButton!
    private var  editMenuBtn:UIButton!
    
    private var menuNameLabel:UILabel!
    private var menuDescriptionLabel:UILabel!
    
    private var  saveBtn:UIButton!
    
    private var proteinCount:UILabel!
    private var proteinAmount = 0
    
    var timer: Timer!

    var audioPlayer : AVAudioPlayer!

    private var firstFlug = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Viewの大きさを取得
        //let viewWidth = self.view.frame.size.width
        //let viewHeight = self.view.frame.size.height
        
        //通知の許可を出す
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }

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
        titleLabel.text = titleStr
        titleLabel.textColor = UIColor.init(named: "MainGray")
        titleLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 52, width: viewWidth - 64, height: 16)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(titleLabel)
        
        let term = UILabel()
        term.text = "期間"
        term.textColor = UIColor.init(named: "MainGray")
        term.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 80, width: viewWidth, height: 20)
        term.font = UIFont.boldSystemFont(ofSize: 20)
        term.textAlignment = NSTextAlignment.left
        self.view.addSubview(term)
        
        let termLabel = UILabel()
        termLabel.text = dateStr
        termLabel.textColor = UIColor.init(named: "MainGray")
        termLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 112, width: viewWidth - 64, height: 16)
        termLabel.font = UIFont.boldSystemFont(ofSize: 16)
        termLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(termLabel)
        
        let menu = UILabel()
        menu.text = "メニュー"
        menu.textColor = UIColor.init(named: "MainGray")
        menu.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 144, width: viewWidth, height: 20)
        menu.font = UIFont.boldSystemFont(ofSize: 20)
        menu.textAlignment = NSTextAlignment.left
        self.view.addSubview(menu)
        
        //メニューの名前
        let menuNameLabel = UILabel()
        menuNameLabel.text = menuTitleStr
        menuNameLabel.textColor = UIColor.init(named: "MainGray")
        menuNameLabel.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 176, width: (viewWidth - 64)/2, height: 16)
        menuNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuNameLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(menuNameLabel)
        
        //メニューの詳細
        let menuDescriptionLabel = UILabel()
        menuDescriptionLabel.text = menuDetailStr
        menuDescriptionLabel.textColor = UIColor.init(named: "MainGray")
        menuDescriptionLabel.frame = CGRect(x: viewWidth/2, y: statusBarHeight + navigationBarHeight + 176, width: (viewWidth - 64)/2, height: 16)
        menuDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        menuDescriptionLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(menuDescriptionLabel)
        
        
        let protein = UILabel()
        protein.text = "プロテイン"
        protein.textColor = UIColor.init(named: "MainGray")
        protein.frame = CGRect(x: 32, y: statusBarHeight + navigationBarHeight + 204, width: (viewWidth-64)-100, height: 20)
        protein.font = UIFont.boldSystemFont(ofSize: 20)
        protein.textAlignment = NSTextAlignment.left
        self.view.addSubview(protein)
        
        proteinCount = UILabel()
        proteinCount.text = String(proteinAmount) + "個"
        proteinCount.textColor = UIColor.init(named: "MainGray")
        proteinCount.frame = CGRect(x: (viewWidth-32)-100 , y: statusBarHeight + navigationBarHeight + 204, width: 100, height: 20)
        proteinCount.font = UIFont.boldSystemFont(ofSize: 20)
        proteinCount.textAlignment = NSTextAlignment.right
        self.view.addSubview(proteinCount)
        
        
        let pi = CGFloat(Double.pi)
        
        //base
        let baseStart:CGFloat = 0 // 開始の角度
        let baseEnd :CGFloat = pi * 2.0// 終了の角度
        let basePath: UIBezierPath = UIBezierPath();
        basePath.move(to: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328))
        basePath.addArc(withCenter: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328), radius: 100, startAngle: baseStart, endAngle: baseEnd, clockwise: true)
        let baseLayer = CAShapeLayer()
        baseLayer.fillColor = UIColor.init(named: "ProgressGray")?.cgColor
        baseLayer.path = basePath.cgPath
        self.view.layer.addSublayer(baseLayer)
        
        //pink
        let pinkStart:CGFloat = pi * 1.5 // 開始の角度
        let pinkEnd :CGFloat = pi * (0.02 * CGFloat(achievement) + 1.5) // 終了の角度
        let pinkPath: UIBezierPath = UIBezierPath();
        pinkPath.move(to: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328))
        pinkPath.addArc(withCenter: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328), radius: 100, startAngle: pinkStart, endAngle: pinkEnd, clockwise: true)
        let pinkLayer = CAShapeLayer()
        pinkLayer.fillColor = UIColor.init(named: "MainPink")?.cgColor
        pinkLayer.path = pinkPath.cgPath
        self.view.layer.addSublayer(pinkLayer)
        
        
        //white
        let whiteStart:CGFloat = 0 // 開始の角度
        let whiteEnd :CGFloat = pi * 2.0// 終了の角度
        let whitePath: UIBezierPath = UIBezierPath();
        whitePath.move(to: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328))
        whitePath.addArc(withCenter: CGPoint(x:viewWidth/2, y:statusBarHeight + navigationBarHeight + 328), radius: 80, startAngle: whiteStart, endAngle: whiteEnd, clockwise: true)
        let whiteLayer = CAShapeLayer()
        whiteLayer.fillColor = UIColor.init(named: "BGGray")?.cgColor
        whiteLayer.path = whitePath.cgPath
        self.view.layer.addSublayer(whiteLayer)
        
        let percentLabel = UILabel()
        percentLabel.text = String(achievement) + " %"
        percentLabel.frame = CGRect(x: 0 , y: statusBarHeight + navigationBarHeight + 308, width: viewWidth, height: 40)
        percentLabel.textAlignment = NSTextAlignment.center
        percentLabel.font = UIFont.boldSystemFont(ofSize: 40)
        self.view.addSubview(percentLabel)
        
        
        let proteinBtn = UIButton()
        proteinBtn.frame = CGRect(x: viewWidth - 72, y: statusBarHeight + navigationBarHeight + 380, width: 60, height: 60)
        proteinBtn.layer.masksToBounds = true
        proteinBtn.backgroundColor = UIColor.init(named: "MainPink")
        proteinBtn.setBackgroundImage(UIImage(named: "protein"), for: UIControlState.normal)
        proteinBtn.layer.cornerRadius = 30.0
        proteinBtn.addTarget(self, action: #selector(proteinButtonClicked(sender:)), for:.touchUpInside)
        self.view.addSubview(proteinBtn)
        
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }

    //proteinボタンが押されたら呼ばれます
    @objc internal func proteinButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        Alamofire.request("http://spajam2018-rails-server.herokuapp.com/api/v0/protein/send/from/1/to/2").responseJSON{ response in
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                if json["is_success"].boolValue {
                    print(json)
                    
                } else {
                }
                print(json)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showAlart() {
        let notificationVC:NotificationVC = NotificationVC()
        notificationVC.modalPresentationStyle = .overCurrentContext
        present(notificationVC, animated: true, completion: nil)
        
        //再生する音源のURLを生成.
        let soundFilePath : String = Bundle.main.path(forResource: "notification", ofType: "caf")!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        audioPlayer = try! AVAudioPlayer(contentsOf: fileURL)
        audioPlayer.play()
    }
    
    @objc func update(tm: Timer) {
        //この関数を繰り返す、repeat this function
        Alamofire.request("http://spajam2018-rails-server.herokuapp.com/api/v0/user/2").responseJSON{ response in
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                if json["is_success"].boolValue {
                    
                    if self.proteinAmount != json["content"]["num_protein"].intValue {
                        self.proteinAmount = json["content"]["num_protein"].intValue
                        self.proteinCount.text = String(self.proteinAmount) + " 個"
                        
                        if self.firstFlug {
                            self.firstFlug = false
                        } else {
                            self.showAlart()
                        }
                    }

                } else {
                }
                print(json)
                
            case .failure(let error):
                print(error)
            }
        }
    }

}
