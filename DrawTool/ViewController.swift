//
//  ViewController.swift
//  DrawTool
//
//  Created by Rasika Patil
//  Copyright © 2018 Rasika Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearTapped() {
        let draview : DrawView = drawView as! DrawView
        draview.lines = []
        draview.setNeedsDisplay()
    
    }
    
    func getImageViewWithView(drawView:UIView) -> UIImage{
    
        UIGraphicsBeginImageContextWithOptions(drawView.bounds.size, drawView.opaque, 0.0)
        drawView.drawViewHierarchyInRect(drawView.bounds, afterScreenUpdates: false)
        let snapshotImageFromDrawView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print(snapshotImageFromDrawView)
        return snapshotImageFromDrawView
    }
    
    @IBAction func shareOnlyImage(sender: UIButton) {
        let image = getImageViewWithView(drawView)
        let imageShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.presentViewController(activityViewController, animated: true, completion:nil)
    }
    
    

}

