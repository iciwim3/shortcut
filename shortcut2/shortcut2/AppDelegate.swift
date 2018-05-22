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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let oceanShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).ocean", localizedTitle: "Ocean", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(templateImageName: "OceanShort"), userInfo: nil)
        
        let flameShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).flame", localizedTitle: "Flame", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(templateImageName: "FlameShort"), userInfo: nil)
        
        application.shortcutItems = [oceanShortcut, flameShortcut]
        
        return true
    }
    
    enum ShortcutType: String {
        case mountains = "mountains"
        case ocean = "ocean"
        case space = "space"
        case flame = "flame"
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UITabBarController
            
            switch type {
            case ShortcutType.ocean.rawValue:
                navVC.selectedIndex = 1
                completionHandler(true)
            case ShortcutType.space.rawValue:
                navVC.selectedIndex = 2
                completionHandler(true)
            case ShortcutType.flame.rawValue:
                navVC.selectedIndex = 3
                completionHandler(true)
                
            default:
                navVC.selectedIndex = 0
                completionHandler(true)
            }
            
        }
        completionHandler(false)
        
    }


}

