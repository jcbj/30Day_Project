//
//  ViewController.swift
//  Project05_AFImageHelper
//
//  Created by jiangchao on 16/2/29.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewBase: UIImageView!
    @IBOutlet weak var imageViewBase2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "http://www.hangge.com/blog/images/logo.png"
        
        //扩展UIImageView方法，直接通过url地址获取图片
        //默认缓存图片
//        self.imageViewBase.imageFromURL(url, placeholder: UIImage())
        
        //支持占位图
//        self.imageViewBase.imageFromURL(url, placeholder: UIImage(named: "loading")!)
        
        //图片加载完，是否淡入显示，是否显示缓存图等
        self.imageViewBase.imageFromURL(url, placeholder: UIImage(named: "loading")!, fadeIn: true, shouldCacheImage: true){
            (image:UIImage?) in
            if image != nil {
                print("图片加载成功！")
            }
            //图片加载成功的回调函数
        }
        
        //UIImage扩展相关使用
        //UIImageView实际就是调用的就是此函数
        UIImage.imageFromURL(url, placeholder: UIImage(named: "loading")!, shouldCacheImage: true, closure: {
            (image: UIImage?) in
            if image != nil {
                self.imageViewBase2.image = image!
            }
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

