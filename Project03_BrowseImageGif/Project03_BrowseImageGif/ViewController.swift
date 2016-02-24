//
//  ViewController.swift
//  Project03_BrowseImageGif
//
//  Created by jiangchao on 16/2/24.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jeremyGif = UIImage.gifWithName("image1")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: (self.view.bounds.width - 290) / 2.0, y: 20.0, width: 290.0, height: 180.0)
        
        self.view.addSubview(imageView)
        
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("iwatch", withExtension: "gif")!)
        let advTimerGif = UIImage.gifWithData(imageData!)
        let imageView2 = UIImageView(image: advTimerGif)
        imageView2.frame = CGRect(x: (self.view.bounds.width - 290) / 2.0, y: 222.0, width: 290.0, height: 202.0)
        
        self.view.addSubview(imageView2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

