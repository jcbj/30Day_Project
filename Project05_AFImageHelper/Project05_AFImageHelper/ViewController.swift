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
//        UIImage.imageFromURL(url, placeholder: UIImage(named: "loading")!, shouldCacheImage: true, closure: {
//            (image: UIImage?) in
//            if image != nil {
//                self.imageViewBase2.image = image!
//            }
//        })
        
        //使用纯色
//        self.imageViewBase2.image = UIImage(color: UIColor.orangeColor())
        
        //使用线性渐变色
//        self.imageViewBase2.image = UIImage(gradientColors: [UIColor.orangeColor(),UIColor.redColor(),UIColor.blueColor()])
        
        //使用放射性渐变色
//        self.imageViewBase2.image = UIImage(startColor: UIColor.redColor(), endColor: UIColor.blueColor(), radialGradientCenter: CGPoint(x: 0.5, y: 0.5), radius: 1, size: CGSize(width: 55, height: 20))
        
        //给图片覆盖一层渐变色，混合
//        let gradientColors = [UIColor(red: 0.996, green: 0.769, blue: 0.494, alpha: 1.0),UIColor(red: 0.969, green: 0.608, blue: 0.212, alpha: 0.2)]
//        self.imageViewBase2.image = UIImage(named: "loading")?.applyGradientColors(gradientColors)
        
        //使用文字生成图片
//        let textSize = 12 * UIScreen.mainScreen().scale     //根据不同设备的缩放比例来调整
//        let imageWidth = 180 * UIScreen.mainScreen().scale
//        let imageHeight = 80 * UIScreen.mainScreen().scale
        
//        if let image = UIImage(text: "JiangXinyu", font: UIFont.systemFontOfSize(textSize), color: UIColor.blueColor(), backgroundColor: UIColor.orangeColor(), size: CGSize(width: imageWidth, height: imageHeight), offset: CGPoint()) {
//            self.imageViewBase2.image = image
//        }
        
        //对UIView对象截图
//        let image = UIImage(fromView: self.view)
//        self.imageViewBase2.image = image
        
//        //是否有透明图层
//        UIImage(named: "loading")?.hasAlpha()
//        //添加透明图层
//        self.imageViewBase2.image = UIImage(named: "loading")?.applyAlpha()
        
        //添加边框
//        self.imageViewBase2.image = UIImage(gradientColors: [UIColor.blueColor(),UIColor.redColor()], size: CGSize(width: 15, height: 15))!.applyPadding(5)
        
        //自定义剪裁位置
//        self.imageViewBase2.image = UIImage(named: "loading")?.crop(CGRectMake(0, 0, 25, 25))
//        self.imageViewBase2.image = UIImage(named: "loading")?.cropToSquare()
        
        //调整大小
//        self.imageViewBase2.image = UIImage(named: "loading")?.resize(CGSize(width: 100, height: 150))
        
        //不设大小回crash
//        self.imageViewBase2.image = UIImage(named: "loading")?.resize(CGSize(width: 200, height: 150))!.roundCorners(15)
        
        //带边框的圆角图片
//        self.imageViewBase2.image = UIImage(named: "loading")?.resize(CGSize(width: 200, height: 150))!.roundCorners(15, border: 50, color: UIColor.lightGrayColor())
        
        //圆形图片
//        self.imageViewBase2.image = UIImage(named: "loading")?.resize(CGSize(width: 200, height: 150))!.roundCornersToCircle()
        
        //带边框的圆形图片
        self.imageViewBase2.image = UIImage(named: "loading")?.resize(CGSize(width: 200, height: 150))!.roundCornersToCircle(border: 5, color: UIColor.orangeColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

