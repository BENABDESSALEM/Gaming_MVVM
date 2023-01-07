//
//  NavigationHelper.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation
import UIKit
import UIWindowTransitions

struct NavigationHelper {
    
    static let shared = NavigationHelper()
    
    func presentVcOverRoot(viewController : UIViewController, animation : UIView.AnimationOptions){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let options = UIWindow.TransitionOptions(direction: .fade, style: .easeIn)
            appDelegate.window?.set(rootViewController: viewController, options: options, nil)
        }
    }
    
    func startApp(){
        NavigationHelper.shared.presentVcOverRoot(viewController: StoryboardScene.Main.mainNVC.instantiate(),
                                                  animation: .curveEaseIn)
    }
    
}
