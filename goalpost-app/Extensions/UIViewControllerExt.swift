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
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromRight
        //key is already set up. Just type in kCATransition
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        //writing false because we have already overridden the settings
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    //same as presentdetail function but there is reference to the current presented viewcontroller, dismiss it, and upon completion of dismissal well add animation to the new view controller
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromRight
        
        //constant to hold current VC
        guard let presentedVC = presentedViewController else { return }
        //first dismissung the current VC and then presenting new one so we can dismiss from FinishedGoalsVC to GoalsVC
        presentedVC.dismiss(animated: false) {
            self.view.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromLeft
        //key is already set up. Just type in kCATransition
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
