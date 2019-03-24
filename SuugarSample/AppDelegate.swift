//
//  AppDelegate.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/24.
//

import UIKit
import MaterialComponents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootVC = TodoListViewController()
        let naviC = MDCAppBarNavigationController(rootViewController: rootVC)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = naviC
        window?.makeKeyAndVisible()
        return true
    }
}
