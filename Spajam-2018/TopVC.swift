import UIKit
import Alamofire
import SwiftyJSON

class TopVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private var tasksTableView: UITableView!
    
    
    private var myItems: NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "センター"

        myItems = ["りんご", "すいか", "もも", "さくらんぼ", "ぶどう", "なし", "さくらんぼ", "ぶどう", "なし", "さくらんぼ", "ぶどう", "なし"]

        //Viewの大きさを取得
        let viewWidth = self.view.frame.size.width
        let viewHeight = self.view.frame.size.height
        
        //テーブルビューの初期化
        tasksTableView = UITableView()
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        tasksTableView.rowHeight = 100
        tasksTableView.register(TasksTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(TasksTableViewCell.self))
        self.view.addSubview(tasksTableView)
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return self.myItems.count
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:TasksTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TasksTableViewCell.self))! as! TasksTableViewCell
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC:DetailVC = DetailVC()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}

