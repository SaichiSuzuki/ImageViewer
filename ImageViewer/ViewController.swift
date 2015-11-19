//
//  ViewController.swift
//  imageViewer
//
//  Created by saichi on 2015/11/19.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{
    
    var ivf: ImageViewerFade!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTestEnvironment()
        ivf = ImageViewerFade(frame: view.frame, image: UIImage(named: "sample.jpg")!)
        self.view.addSubview(ivf)
    }
    
    func createTestEnvironment(){
        self.view.backgroundColor = UIColor.greenColor()
        let testButton = UIButton(frame: CGRectMake(100, 100, 100, 100))
        testButton.setTitle("button", forState: .Normal)
        testButton.backgroundColor = UIColor.blackColor()
        testButton.addTarget(self, action: "ivfInit", forControlEvents:.TouchUpInside)
        self.view.addSubview(testButton)
    }
    
    func ivfInit(){
        ivf.setContentOffset(CGPoint(x: 0, y: ivf.frame.midY), animated: false) // move bottom
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
