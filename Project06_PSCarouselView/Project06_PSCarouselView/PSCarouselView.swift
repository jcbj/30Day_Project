//
//  PSCarouselView.swift
//  Project06_PSCarouselView
//
//  Created by jiangchao on 16/3/3.
//  Copyright © 2016年 jiangchao. All rights reserved.
//

import UIKit

struct GlobalData{
    static let MIN_MOVING_TIMEINTERVAL: Double = 0.1
    static let DEFAULT_MOVING_TIMEINTERVAL: Double = 3
    static let PSCAROUSECOLLECTIONCELL: String = "PSCarouseCollectionCell"
}

//定义代理接口
@objc protocol PSCarouselDelegate {
    
    //滚动到第几页
    optional func didMoveToPage(carousel: PSCarouselView, pageIndex: Int)
    //点击了第几页
    optional func didTouchPage(carousel: PSCarouselView, pageIndex: Int)
    //第几页下载完成
    optional func didDownloadImages(carousel: PSCarouselView, pageIndex: Int)
}

//
@IBDesignable
class PSCarouselView:   UICollectionView,
                        UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout{

    var imageURLs: [String]?
    var isNeedRefresh: Bool?
    var timer: NSTimer?
    
    @IBInspectable var placeholder:UIImage?
    @IBInspectable var autoMoving:Bool = false
    @IBInspectable var movingTimeInterval:Double = GlobalData.DEFAULT_MOVING_TIMEINTERVAL
    @IBInspectable var pageDelegate:PSCarouselDelegate?
    
    //MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        self.movingTimeInterval = GlobalData.DEFAULT_MOVING_TIMEINTERVAL
        self.autoMoving = false
        
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
     
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        self.collectionViewLayout = layout
        
        self.registerNib(UINib(nibName: GlobalData.PSCAROUSECOLLECTIONCELL, bundle: nil), forCellWithReuseIdentifier: GlobalData.PSCAROUSECOLLECTIONCELL)
        
        self.registerNotification()
    }
    
    override func layoutSubviews() {
        
        if let isNeedRefresh = self.isNeedRefresh, let imageURLs = self.imageURLs {
            if isNeedRefresh && imageURLs.count > 0 {
                self.scrollToItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
                self.isNeedRefresh = false
            }
        }
        
        super.layoutSubviews()
    }
    
    //MARK: Public Methods
    func startMoving() {
        self.addTimer()
    }
    
    func stopMoving() {
        self.removeTimer()
    }
    
    //MARK: Private Methods
    
    func addTimer() {
        
        self.removeTimer()
        
        let speed = (self.movingTimeInterval < GlobalData.MIN_MOVING_TIMEINTERVAL ? GlobalData.DEFAULT_MOVING_TIMEINTERVAL : self.movingTimeInterval)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: Selector("moveToNextPage"), userInfo: nil, repeats: true)
        
        self.timer?.tolerance = 0.1 * speed
    }
    
    func removeTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func moveToNextPage() {
        if let currentIndexPath = self.indexPathForItemAtPoint(self.contentOffset) {
            let nextIndexPath = NSIndexPath(forItem: currentIndexPath.item + 1, inSection: currentIndexPath.section)
            self.scrollToItemAtIndexPath(nextIndexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        }
    }
    
    func tellDelegateCurrentPage() {
        if let indexPath = self.indexPathForItemAtPoint(self.contentOffset) {
            
            if let pageDelegate = self.pageDelegate,
                let didMoveToPage = pageDelegate.didMoveToPage {
                didMoveToPage(self, pageIndex: indexPath.item - 1)
            }
        }
    }
    
    func registerNotification() {
        
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}
