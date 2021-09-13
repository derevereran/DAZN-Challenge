//
//  AppDelegate.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let rootVC = FeedVC()
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.barTintColor = .blue
        navController.navigationBar.backgroundColor = .blue
        window?.rootViewController = navController
        return true
    }

}

