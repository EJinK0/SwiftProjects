//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이진경 on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lbHello: UILabel!
    @IBOutlet var txName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lbHello.text = "Hello" + txName.text!
    }
}

