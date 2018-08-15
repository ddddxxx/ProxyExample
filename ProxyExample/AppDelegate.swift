//
//  AppDelegate.swift
//  ProxyExample
//
//  Created by noctis on 2018/8/15.
//  Copyright © 2018年 ddddxxx. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        _ = UITableView._swizzler_setDelegate
        return true
    }
    
}
