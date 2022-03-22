//
//  ViewController.swift
//  ImageView2
//
//  Created by 이진경 on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    var img: UIImage?
    var imgName: String = ""
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img = UIImage(named: "1.png")
        imgView.image = img
    }

    @IBAction func btnPre(_ sender: UIButton) {
        if(count < 2){
            imgName = "1.png"
        }
        else{
            count -= 1
            imgName = String(count) + ".png"
        }
        
        img = UIImage(named: imgName)
        imgView.image = img
    }
    
    @IBAction func btnAfter(_ sender: UIButton) {
        if(count >= 6){
            imgName = "6.png"
        }
        else{
            count += 1
            imgName = String(count) + ".png"
        }
        
        img = UIImage(named: imgName)
        imgView.image = img
    }
}

