import UIKit
import SCLAlertView

class AddPlanListVC: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    //テーブルビューインスタンス
    private var planListTableView: UITableView!
    
    //テーブルビューに表示する配列
    private var planList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //テーブルビューに表示する配列
        planList = ["ランニング", "腕立て伏せ", "腹筋", "スクワット"]
        
        //Viewの大きさを取得
        let viewWidth = self.view.frame.size.width
        let viewHeight = self.view.frame.size.height
        
        //テーブルビューの初期化
        planListTableView = UITableView()
        planListTableView.delegate = self
        planListTableView.dataSource = self
        planListTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        planListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(planListTableView)
        
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return self.planList.count
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.planList[indexPath.row]
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appearance = SCLAlertView.SCLAppearance( showCloseButton: false)
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("目標を入力してください")
        alert.addButton("保存") {
            if let name = txt.text {
                if name != "" {

                } else {
                    SCLAlertView().showError("Error", subTitle: "目標を入力してください") // Error
                }
            }
        }
        alert.addButton("キャンセル") { }
        alert.showEdit("目標入力", subTitle: "目標名を入力してください")
    }

}
