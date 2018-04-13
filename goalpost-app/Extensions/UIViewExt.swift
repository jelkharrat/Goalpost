//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/11/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

extension UIView {
    //add observer that observes notification that tells us when keyboard changes frame
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name:  NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        //userInfo is a dictionary which we pull out values from a key
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        //defines how the keyboard is animated (slows or speeds up)
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        //captures frame of keyboard before it goes up (tells us where it is). Can turn into CGRect
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //subtracts starting point from ending point so this var tells us the height of the keyboard
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        //Taking height of keyboard and moving everything else up by that much
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    
    //function that animates frame of whatever object we bind the keyboard to
}
