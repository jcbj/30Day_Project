//
//  TimerViewController.swift
//  Project01_Timer
//
//  定时器开始的数字输入没加判断
//  UITextField设置的大字体sb中有效果，实际运行没有效果，还是很小的字
//
//  Created by jiangchao on 16/2/22.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var tfText: UITextField!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonPause: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    
    var count:Double = 30.0
    var timer:NSTimer = NSTimer()
    var isPlay:Bool = false
    var isPause:Bool = false
    
    override func viewDidLoad() {
        self.buttonStart.enabled = true
        self.buttonPause.enabled = false
        self.buttonReset.enabled = false
        
        self.updateTfText()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonStartTouch(sender: AnyObject) {
        if !self.isPlay {
            //string to double -> NSString
            let value:NSString = NSString(string: self.tfText.text!)
            self.count = value.doubleValue
            
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerText"), userInfo: nil, repeats: true)
        }
        
        self.isPlay = true
        self.isPause = false
        
        self.tfText.enabled = false
        self.buttonPause.enabled = true
        self.buttonStart.enabled = false
    }

    @IBAction func buttonPauseTouch(sender: AnyObject) {
        self.isPause = true
        
        self.buttonStart.enabled = true
        self.buttonPause.enabled = false
        self.buttonReset.enabled = true
    }
    
    @IBAction func buttonResetTouch(sender: AnyObject) {
        self.timer.invalidate()
        
        self.isPlay = false
        self.isPause = false
        
        self.buttonPause.enabled = false
        self.buttonStart.enabled = true
        self.buttonReset.enabled = false
        
        self.tfText.enabled = true
        
        self.count = 30.0
        
        self.updateTfText()
    }
    
    func updateTimerText() {
        
        guard self.isPlay && !self.isPause else {
            return
        }
        
        self.count -= 0.1
        self.updateTfText()
        
        if 0 == Int(self.count * 10) {
            self.buttonResetTouch(self.buttonReset)
        }
    }
    
    func updateTfText() {
        self.tfText.text = String.localizedStringWithFormat("%0.1f", self.count)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
