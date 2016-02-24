//
//  PlayGifViewController.swift
//  Project03_BrowseImageGif
//
//  Created by jiangchao on 16/2/24.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

class PlayGifViewController: UIViewController {

    @IBOutlet weak var imageViewPlayGif: UIImageView!
    @IBOutlet weak var buttonPlay: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        YLGIFImage.setPrefetchNum(5)
        
        let path = NSBundle.mainBundle().URLForResource("iwatch", withExtension: "gif")?.absoluteString as String!
        self.imageViewPlayGif.image = YLGIFImage(contentsOfFile: path)
        
        self.changedButtonTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changedButtonTitle() {
        
        if self.imageViewPlayGif.isAnimating() {
            self.buttonPlay.setTitle("Pause", forState: UIControlState.Normal)
        } else {
            self.buttonPlay.setTitle("Play", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func buttonPlayTouch(sender: AnyObject) {
        if self.imageViewPlayGif.isAnimating() {
            self.imageViewPlayGif.stopAnimating()
        } else {
            self.imageViewPlayGif.startAnimating()
        }
        
        self.changedButtonTitle()
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
