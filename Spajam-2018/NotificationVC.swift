import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width

        let closeBtn = UIButton()
        closeBtn.frame = self.view.frame
        closeBtn.backgroundColor = .gray
        closeBtn.alpha = 0.2
        closeBtn.addTarget(self, action: #selector(doClose(sender:)), for:.touchUpInside)
        self.view.addSubview(closeBtn)
        
        let muscleView = UIView()
        muscleView.frame = CGRect(x: 0, y: 0, width: width, height: 120)
        muscleView.backgroundColor = .white
        
        let label = UILabel()
        label.frame =  CGRect(x: 0, y: 20, width: width, height: 100)
        label.text = "プロテインが\n届きました"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.textAlignment = .center
        muscleView.addSubview(label)
        self.view.addSubview(muscleView)
    }
    
    
    @objc internal func doClose(sender: UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}
