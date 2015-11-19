//
//  ImageViewer.swift
//  imageViewer
//
//  Created by saichi on 2015/11/19.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import UIKit

class ImageViewer: UIScrollView, UIScrollViewDelegate {
    var imageView: UIImageView!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        self.delegate = self
        self.minimumZoomScale = 1
        self.maximumZoomScale = 3
        self.scrollEnabled = true
        self.showsHorizontalScrollIndicator = true
        self.showsVerticalScrollIndicator = true
        
        imageView = UIImageView(frame: frame)
        imageView.image = image
        self.addSubview(imageView)
        
        var doubleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self
            , action:"doubleTap:")
        doubleTapGesture.numberOfTapsRequired = 2
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTapGesture)
    }
    
    // pinch in / pinch out
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    // double tap
    func doubleTap(gesture: UITapGestureRecognizer) -> Void {
        if ( self.zoomScale < self.maximumZoomScale ) {
            var newScale:CGFloat = self.zoomScale * 3
            var zoomRect:CGRect = self.zoomRectForScale(newScale, center: gesture.locationInView(gesture.view))
            self.zoomToRect(zoomRect, animated: true)
        } else {
            self.setZoomScale(1.0, animated: true)
        }
    }
    func zoomRectForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
        zoomRect.size.height = self.frame.size.height / scale
        zoomRect.size.width = self.frame.size.width / scale
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        return zoomRect
    }
}