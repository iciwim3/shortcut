//
//  AppDelegate.swift
//  shortcut2
//
//  Created by Sain-R Edwards on 5/16/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainVC = storyboard.instantiateViewController(withIdentifier: MOUNTAINS_VC) as! MountainVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: OCEAN_VC) as! OceanVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: SPACE_VC) as! SpaceVC
        
        vcsArray = [mountainVC, oceanVC, spaceVC]
        
        return true
    }
    
    enum ShortcutType: String {
        case mountains = "mountains"
        case ocean = "ocean"
        case space = "space"
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UINavigationController
            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortcutType.ocean.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
            case ShortcutType.space.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
                
            default:
                navVC.popToRootViewController(animated: true)
                completionHandler(true)
            }
            
        }
        completionHandler(false)
        
    }


}

