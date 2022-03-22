//
//  ViewController.swift
//  DatePicker
//
//  Created by 이진경 on 2022/02/06.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lbCurrentTime: UILabel!
    @IBOutlet var lbPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let forMatter = DateFormatter()
        
        forMatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbPickerTime.text = "선택시간 : " + forMatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lbCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lbCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
}

