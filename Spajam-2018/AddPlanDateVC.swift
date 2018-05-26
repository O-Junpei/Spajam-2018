import UIKit

protocol DatePickerDelegate: class  {
    func editStartBtn(year:String, month:String, day:String)
    func editEndBtn(year:String, month:String, day:String)
}

class AddPlanDateVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //delegate
    weak var delegate: DatePickerDelegate?
    
    var isStart:Bool!
    
    // UIPickerView.
    private var datePicker: UIPickerView!
    
    var tabBarHeight:CGFloat!
    var year:String!
    var month:String!
    var day:String!
    
    private let yearAry: Array<String>  = ["2015","2016","2017","2018","2019","2020","2021"]
    private let monthAry: Array<String>  = ["01","02","03", "04","05", "06", "07","08","09","10","11", "12"]
    private let dayAry: Array<String> = ["01","02","03", "04","05" ,"06", "07","08","09","10", "11","12","13","14", "15","16", "17","18","19","20","21","22","23", "24","25" ,"26", "27","28","29","30", "31" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height

        //close
        let closeBtn = UIButton()
        closeBtn.frame = self.view.frame
        closeBtn.backgroundColor = UIColor.gray
        closeBtn.alpha = 0.8
        closeBtn.addTarget(self, action: #selector(doClose(sender:)), for:.touchUpInside)
        self.view.addSubview(closeBtn)

        // make UIPickerView instance
        datePicker = UIPickerView()
        datePicker.frame = CGRect(x: 0, y: height - 200 - tabBarHeight, width: width, height: 200)
        datePicker.delegate = self
        datePicker.dataSource = self
        
        if let yearIndex = yearAry.index(of: year) {
            if yearIndex < 7 {
                datePicker.selectRow(yearIndex, inComponent: 0, animated: true)
            }
        }
        
        if let monthIndex = monthAry.index(of: month) {
            if monthIndex < 11 {
                datePicker.selectRow(monthIndex, inComponent: 1, animated: true)
            }
        }
        
        if let dayIndex = dayAry.index(of: day) {
            if dayIndex < 32 {
                datePicker.selectRow(dayIndex, inComponent: 2, animated: true)
            }
        }
        self.view.addSubview(datePicker)
    }
    
    @objc internal func doClose(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    
    
    // Compenetの数を設定
    // Set number of Compenet
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // foodMenus + drinkMenus + dessertMenus
        return 3
    }
    
    // Compenetの要素数を設定
    // Set the number of elements of Compenet
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return yearAry.count
        case 1:
            return monthAry.count
        case 2:
            return dayAry.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let cellLabel = UILabel()
        cellLabel.frame = CGRect(x: 0, y: 0, width: pickerView.rowSize(forComponent: 0).width, height: pickerView.rowSize(forComponent: 0).height)
        cellLabel.textAlignment = .center
        cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cellLabel.backgroundColor = UIColor.init(named: "MainPink")
        cellLabel.textColor = UIColor.white
        
        switch component {
        case 0:
            cellLabel.text = yearAry[row]
        case 1:
            cellLabel.text = monthAry[row]
        case 2:
            cellLabel.text =  dayAry[row]
        default:
            cellLabel.text = "Error"
        }
        
        return cellLabel
    }
    
    // ピッカーが動いたら呼ばれる
    // Called when picker moved
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("componet: \(component)")
        print("row: \(row)")
        
        print(pickerView.numberOfRows(inComponent: 1))
        print(pickerView.selectedRow(inComponent: 1))
        
        if isStart {
            delegate?.editStartBtn(year: yearAry[pickerView.selectedRow(inComponent: 0)], month: monthAry[pickerView.selectedRow(inComponent: 1)], day: dayAry[pickerView.selectedRow(inComponent: 2)])
        } else {
            delegate?.editEndBtn(year: yearAry[pickerView.selectedRow(inComponent: 0)], month: monthAry[pickerView.selectedRow(inComponent: 1)], day: dayAry[pickerView.selectedRow(inComponent: 2)])
        }
        

    }
}
