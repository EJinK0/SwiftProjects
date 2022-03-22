//
//  ViewController.swift
//  DatePicker2
//
//  Created by 이진경 on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    var currentTime = ""
    var pickerTime = ""
    
    @IBOutlet var lbPickerTime: UILabel!
    @IBOutlet var lbCurrnetTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        lbPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        pickerTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        lbCurrnetTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        currentTime = formatter.string(from: date as Date)
        
        if(currentTime == pickerTime) {
            view.backgroundColor = UIColor.red
            count += 1
        }
        else {
            count = 0
            view.backgroundColor = UIColor.white
        }
        
        if(count == 60) {
            count = 0
            view.backgroundColor = UIColor.white
        }
    }
}

