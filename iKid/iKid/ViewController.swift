//
//  ViewController.swift
//  iKid
//
//  Created by Isaac Chen on 2/6/18.
//  Copyright © 2018 Isaac Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    fileprivate var punJoke1 = "What do you call a pile of cats?"
    fileprivate var punJoke2 = "A meowntain"
    fileprivate var goodJoke1 = "Have you ever eatten a clock?"
    fileprivate var goodJoke2 = "It's very time consuming"
    fileprivate var dadJoke1 = "I got an index out of bound error"
    fileprivate var dadJoke2 = "but I'm BOUNDLESS"
    fileprivate var current = ""
    
    fileprivate var good1 : GoodViewController1!
    fileprivate var good2 : GoodViewController2!
    
    @IBAction func nextBTN(_ sender: Any) {
        if current == "" {
            display.text = "!!!I SAID SELECT A JOKE TYPE!!!"
        } else if current == "dad" {
            good1Builder()
            good2Builder()
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)

            if good1 != nil &&
                good1?.view.superview != nil {
                display.text = dadJoke2
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                good2.view.frame = view.frame
                switchViewController(good1, to: good2)
            } else {
                display.text = dadJoke1
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                good1.view.frame = view.frame
                switchViewController(good2, to: good1)
            }

            UIView.commitAnimations()
        } else if current == "good" {

            good1Builder()
            good2Builder()
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)

            if good1 != nil &&
                good1?.view.superview != nil {
                display.text = goodJoke2
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                good2.view.frame = view.frame
                switchViewController(good1, to: good2)
            } else {
                display.text = goodJoke1
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                good1.view.frame = view.frame
                switchViewController(good2, to: good1)
            }

            UIView.commitAnimations()

        } else if current == "pun" {

            good1Builder()
            good2Builder()
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)

            if good1 != nil &&
                good1?.view.superview != nil {
                display.text = punJoke2
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                good2.view.frame = view.frame
                switchViewController(good1, to: good2)
            } else {
                display.text = punJoke1
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                good1.view.frame = view.frame
                switchViewController(good2, to: good1)
            }

            UIView.commitAnimations()
        }
    }
    
    @IBAction func dadBTN(_ sender: Any) {
        good1Builder()
        good2Builder()
        display.text = dadJoke1
        current = "dad"
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        good1.view.frame = view.frame
        switchViewController(good2, to: good1)
        
        
        UIView.commitAnimations()
    }
    
    @IBAction func punBTN(_ sender: Any) {
        good1Builder()
        good2Builder()
        display.text = punJoke1
        current = "pun"
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        good1.view.frame = view.frame
        switchViewController(good2, to: good1)
        
        
        UIView.commitAnimations()
    }
    
    
    @IBAction func goodBTN(_ sender: Any) {
        good1Builder()
        good2Builder()
        display.text = goodJoke1
        current = "good"
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
//        if good1 != nil &&
//            good1?.view.superview != nil {
//            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
//            good2.view.frame = view.frame
//            switchViewController(good1, to: good2)
//        }

        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
        good1.view.frame = view.frame
        switchViewController(good2, to: good1)

        
        UIView.commitAnimations()
    }
    
    fileprivate func good1Builder() {
        if good1 == nil {
            good1 =
                storyboard?
                    .instantiateViewController(withIdentifier: "good1")
                as! GoodViewController1
        }
    }
    fileprivate func good2Builder() {
        if good2 == nil {
            good2 =
                storyboard?
                    .instantiateViewController(withIdentifier: "good2")
                as! GoodViewController2
        }
    }
    
    
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

