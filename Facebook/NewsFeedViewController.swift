//
//  NewsFeedViewController.swift
//  Facebook
//
//  Updated by Alicia Fremling 03/05/2016.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTransition = ImageTransition()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPhotoTap(sender: AnyObject) {
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("toImageView", sender: self)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    //UIStoryboardSegue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.view.layoutIfNeeded()
        
        photoViewController.photoImageView.image = selectedImageView.image
        
//        if performSegueWithIdentifier("toImageView", sender: self) {
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = imageTransition
//        }
//        else {
//            
//        }
    }
}


