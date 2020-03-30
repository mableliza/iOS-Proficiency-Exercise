//
//  AppDelegate.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rootVC = ViewController()
    let rootNC = UINavigationController(rootViewController: rootVC)
    window?.rootViewController = rootNC
    window?.makeKeyAndVisible()
    
    return true
  }
  
  
  
  
}

