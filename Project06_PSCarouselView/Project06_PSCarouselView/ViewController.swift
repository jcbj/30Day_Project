//
//  ViewController.swift
//  Project06_PSCarouselView
//
//  Created by jiangchao on 16/3/1.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageViewTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let url = NSURL(string: "http://www.hangge.com/blog/images/logo.png")
        self.imageViewTest.sd_setImageWithURL(url, placeholderImage: UIImage(named: "loading"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

