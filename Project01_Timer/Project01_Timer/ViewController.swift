//
//  ViewController.swift
//  Project01_Timer
//
//  Created by jiangchao on 16/2/22.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonStop: UIButton!
    
    var count:Double = 0.00
    var timer:NSTimer = NSTimer()
    var isPlay:Bool = false
    var isStop:Bool = false
    
    override func viewDidLoad() {
        self.buttonReset.enabled = false
        self.buttonStop.enabled = false
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonResetTouch(sender: AnyObject) {
        self.timer.invalidate()
        
        self.isPlay = false
        self.isStop = false
        
        self.buttonStart.enabled = true
        self.buttonStop.enabled = false
        self.buttonReset.enabled = false
        
        self.count = 0.00
        self.labelText.text = String(self.count);
    }
    
    @IBAction func buttonStartTouch(sender: AnyObject) {
        
        if !self.isPlay {
            
            //scheduled*:不需要手动调用fair,会自动执行，并且自动加入主循环池
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            
            //swift: 未实现NSInvocation相关内容
            //self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, invocation: invo, repeats: true)
        }
        
        self.isPlay = true
        self.isStop = false
        
        self.buttonStop.enabled = true
        self.buttonStart.enabled = false
    }
    
    @IBAction func buttonStopTouch(sender: AnyObject) {
        self.isStop = true
        
        self.buttonReset.enabled = true
        self.buttonStart.enabled = true
        self.buttonStop.enabled = false
    }
    
    func updateTimer() {
        if !self.isPlay {
            return
        }
        
        if self.isStop {
            return
        }
        
        self.count += 0.1;
        self.labelText.text = String.init(format: "%0.1f", self.count);
    }
}

