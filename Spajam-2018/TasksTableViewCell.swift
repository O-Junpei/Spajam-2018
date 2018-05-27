
import UIKit

class TasksTableViewCell: UITableViewCell {
    
    var iconImageView:UIImageView!
    var titleLabel:UILabel!
    var dateLabel:UILabel!
    
    var progressTop:UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        titleLabel = UILabel()
        dateLabel = UILabel()
        progressTop = UIView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //iconImageView
        iconImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        //iconImageView.image = UIImage(named: "run")
        iconImageView.backgroundColor = .white
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = false
        
        //影つけるよ
        iconImageView.layer.shadowColor = UIColor.black.cgColor
        iconImageView.layer.shadowOpacity = 0.5 // 透明度
        iconImageView.layer.shadowOffset = CGSize(width: 5, height: 5) // 距離
        iconImageView.layer.shadowRadius = 5 // ぼかし量
        
        // 以下、角丸パス追加とラスタライズで高速化
        iconImageView.layer.shadowPath = UIBezierPath(roundedRect: iconImageView.bounds, cornerRadius: 10).cgPath
        iconImageView.layer.shouldRasterize = true
        iconImageView.layer.rasterizationScale = UIScreen.main.scale
        self.addSubview(iconImageView)
        
        
        //TaskTitle
        titleLabel.frame = CGRect(x: 110, y: 12, width: frame.width - 120, height: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.gray
        titleLabel.textAlignment = NSTextAlignment.left
        //taskNameLabel.text = "１週間マラソン"
        self.addSubview(titleLabel)
        
        //taskDescription
        dateLabel.frame = CGRect(x: 110, y: 40, width: 200, height: 16)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        dateLabel.textColor = UIColor.gray
        dateLabel.textAlignment = NSTextAlignment.left
        //taskDescriptionLabel.text = "１週間でフルマラソン走りますよ、頑張るよ"
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
        //let rect: CGSize = taskDescriptionLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        //taskDescriptionLabel.frame = CGRect(x: 110, y: 32, width: rect.width, height: rect.height)
        self.addSubview(dateLabel)
        
        let progressBase = UIView()
        progressBase.frame = CGRect(x: 110, y: 68, width: 200, height: 16)
        progressBase.backgroundColor = UIColor.init(named: "BtnGray")
        self.addSubview(progressBase)
        
        progressTop.backgroundColor = UIColor.init(named: "MainPink")
        self.addSubview(progressTop)
    }

}
