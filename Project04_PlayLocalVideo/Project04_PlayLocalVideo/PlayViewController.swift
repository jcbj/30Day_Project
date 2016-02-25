//
//  PlayViewController.swift
//  Project04_PlayLocalVideo
//
//  Created by jiangchao on 16/2/25.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayViewController: UIViewController {

    var avPlayerViewController:AVPlayerViewController!
    var avPlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPlayMusicTouch(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("红豆", ofType: "mp3")
        guard (nil != path) else {
            NSLog("Path for Resource is nil")
            
            return
        }
        
        let url = NSURL(fileURLWithPath: path!)
        
        self.avPlayerViewController = AVPlayerViewController()
        self.avPlayerViewController.player = AVPlayer(URL: url)
        
        self.presentViewController(self.avPlayerViewController, animated: true, completion: { () -> Void in
                self.avPlayerViewController.player?.play()
        })
    }
    
    @IBAction func buttonPlayTouch(sender: AnyObject) {
        //添加视频文件时，要选中“Add to targets”中项目，否则无法获取到资源文件,
        //添加其它文件时默认是选中的
//        let videoPath = NSBundle.mainBundle().pathForResource("TestiMovie", ofType: "mp4")
//        guard (videoPath != nil) else {
//            return
//        }
//        let url = NSURL(fileURLWithPath: videoPath!)
        
        let url = NSBundle.mainBundle().URLForResource("VID_20150319_081308", withExtension: "mp4")!
        
        //实例化
        let player = AVPlayer(URL:url)
        //实例化.
        self.avPlayerViewController = AVPlayerViewController()
        //设置默认
        self.avPlayerViewController.player = player
        //转场，弹出播放窗口
        self.presentViewController(self.avPlayerViewController, animated: true){
            () -> Void in
            //开始播放
            self.avPlayerViewController.player?.play()
        }
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
