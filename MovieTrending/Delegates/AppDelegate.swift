//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Can on 30.01.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationControler = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationControler
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
