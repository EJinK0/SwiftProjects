//
//  ViewController.swift
//  ImageView
//
//  Created by 이진경 on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var btnReSize: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
     
        if(isZoom){
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnReSize.setTitle("확대", for: .normal)
        }
        else{
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnReSize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnoff(_ sender: UISwitch) {
        if(sender.isOn){
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
}
