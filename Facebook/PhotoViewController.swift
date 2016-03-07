//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Fremling, Alicia (Contractor) on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var photoActionsImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 530)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        doneButton.alpha = 1
        photoActionsImage.alpha = 1
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.doneButton.alpha = 0
            self.photoActionsImage.alpha = 0
            if scrollView.contentOffset.y > 0 {
                    self.scrollView.backgroundColor = UIColor(white: 0, alpha: ((90-scrollView.contentOffset.y)/100))
            }
            else {
                self.scrollView.backgroundColor = UIColor(white: 0, alpha: ((90 + scrollView.contentOffset.y)/100))
            }
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            if scrollView.contentOffset.y < -30 {
                self.dismissViewControllerAnimated(true) { () -> Void in
                }
            }
            else if scrollView.contentOffset.y > 30 {
                self.dismissViewControllerAnimated(true) { () -> Void in
                }
            }
            else {
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.doneButton.alpha = 1
        self.photoActionsImage.alpha = 1
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        // This method is called when the scrollview finally stops scrolling.
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
