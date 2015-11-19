//
//  ImageViewerFade.swift
//  imageViewerFade
//
//  Created by saichi on 2015/11/19.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import UIKit

class ImageViewerFade: UIScrollView, UIScrollViewDelegate {
    
    let fadeLine: CGFloat = 0.5
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        self.bounces = false
        self.contentSize.height = frame.height*1.5
        self.setContentOffset(CGPoint(x: 0, y: frame.midY), animated: false) // move bottom
        self.delegate = self
        self.backgroundColor = UIColor.blackColor()
        let imageViewer = ImageViewer(frame: frame, image: image)
        imageViewer.layer.position = CGPoint(x: frame.width/2, y: frame.height)
        self.addSubview(imageViewer)
    }
    
    /** middle */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.alpha = scrollView.contentOffset.y / frame.midY
    }
    
    /** end */
    func scrollViewDidEndDragging(scrollView: UIScrollView,willDecelerate decelerate: Bool){
        if (scrollView.contentOffset.y / frame.midY) < fadeLine {
            self.setContentOffset(CGPoint(x: 0, y: 0), animated: true) // init
        }else{
            self.setContentOffset(CGPoint(x: 0, y: frame.midY), animated: true) // init
        }
    }
    
    /** stop */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        if (scrollView.contentOffset.y / frame.midY) < fadeLine {
            self.setContentOffset(CGPoint(x: 0, y: 0), animated: true) // init
        }else{
            self.setContentOffset(CGPoint(x: 0, y: frame.midY), animated: true) // init
        }
    }
    
}