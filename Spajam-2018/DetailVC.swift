import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Viewの大きさを取得
        //let viewWidth = self.view.frame.size.width
        //let viewHeight = self.view.frame.size.height

        self.title = "メニュー"
        self.view.backgroundColor = .white
        
        
        
        let pi = CGFloat(Double.pi)
        let start:CGFloat = pi * 1.5 // 開始の角度
        let end :CGFloat = pi * 1.0// 終了の角度
        
        let path: UIBezierPath = UIBezierPath();
        path.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2))
        path.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2), radius: 100, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orange.cgColor
        layer.path = path.cgPath
        
        
        
        
        
        
        self.view.layer.addSublayer(layer)
        
    }


}
