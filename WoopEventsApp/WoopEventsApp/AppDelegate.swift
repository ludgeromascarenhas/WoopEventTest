//
//  AppDelegate.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let mainVC = storyboard.instantiateViewController(withIdentifier: "eventListViewController") as! EventListViewController
        
        let eventViewModel = EventViewModel()
        mainVC.eventViewModel = eventViewModel

        let navigationController = UINavigationController(rootViewController: mainVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }


}

