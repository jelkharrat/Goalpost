//
//  UIViewControllerExt.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/8/18.
//  Copyright © 2018 practice. All rights reserved.
//

//Need to give View Controllers a Storyboard ID

import UIKit

//overriding default animation when presenting view controller with own animation

extension UIViewController {
    //setting as internal parameter with _
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        //key is already set up. Just type in kCATransition
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        //writing false because we have already overridden the settings
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        //key is already set up. Just type in kCATransition
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
