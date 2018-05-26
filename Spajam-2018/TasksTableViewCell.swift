
import UIKit

class TasksTableViewCell: UITableViewCell {
    
    var timeLabel:UILabel!
    var alarmNameLabel:UILabel!
    var weekLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        timeLabel = UILabel()
        alarmNameLabel = UILabel()
        weekLabel = UILabel()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //let cellWidth:CGFloat = self.frame.width
        //let cellHeight:CGFloat = self.frame.height
        
        //timeLabel
        timeLabel.frame = CGRect(x: 16, y: 8, width: 200, height: 24)
        timeLabel.text = "07:00"
        timeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        timeLabel.textColor = UIColor.gray
        timeLabel.textAlignment = NSTextAlignment.left
        self.addSubview(timeLabel)
        
        //timeLabel
        alarmNameLabel.frame = CGRect(x: 16, y: 36, width: 200, height: 18)
        alarmNameLabel.text = "アラーム名"
        alarmNameLabel.font = UIFont.systemFont(ofSize: 18)
        alarmNameLabel.textColor = UIColor.gray
        alarmNameLabel.textAlignment = NSTextAlignment.left
        self.addSubview(alarmNameLabel)
        
        
        //timeLabel
        weekLabel.frame = CGRect(x: 16, y: 56, width: 200, height: 18)
        weekLabel.text = "毎日"
        weekLabel.font = UIFont.systemFont(ofSize: 18)
        weekLabel.textColor = UIColor.gray
        weekLabel.textAlignment = NSTextAlignment.left
        self.addSubview(weekLabel)
        
    }

}
