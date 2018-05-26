
import UIKit

class TasksTableViewCell: UITableViewCell {
    
    //var timeLabel:UILabel!
    //var alarmNameLabel:UILabel!
    //var weekLabel:UILabel!
    
    var iconImageView:UIImageView!
    var taskNameLabel:UILabel!
    var taskDescription:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        taskNameLabel = UILabel()
        taskDescription = UILabel()
        //timeLabel = UILabel()
        //alarmNameLabel = UILabel()
        //weekLabel = UILabel()
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
        
        
        //iconImageView
        iconImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        iconImageView.image = UIImage(named: "tab-icon-sample")
        self.addSubview(iconImageView)
        
        //TaskTitle
        taskNameLabel.frame = CGRect(x: 120, y: 0, width: 200, height: 24)
        taskNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        taskNameLabel.textColor = UIColor.gray
        taskNameLabel.textAlignment = NSTextAlignment.left
        taskNameLabel.text = "aaaa"
        self.addSubview(taskNameLabel)
        /*
        
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
 */
 
    }

}
