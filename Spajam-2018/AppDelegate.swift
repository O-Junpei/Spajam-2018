//
//  AppDelegate.swift
//  Spajam-2018
//
//  Created by junpei ono on 2018/05/26.
//  Copyright © 2018年 junpei ono. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.makeKeyAndVisible()
        
        UITabBar.appearance().tintColor = .green
        UITabBar.appearance().unselectedItemTintColor = .red
        UITabBar.appearance().barTintColor = .orange
        UITabBar.appearance().isTranslucent = false
        
        
        // ページを格納する配列
        var viewControllers: [UIViewController] = []
        
        let firstViewController: TopVC? = TopVC()
        firstViewController?.tabBarItem = UITabBarItem(title: "センター", image: UIImage(named: "tab-icon-square"), tag: 1)
        navigationController = UINavigationController(rootViewController: firstViewController!)
        viewControllers.append(navigationController!)
    
        let secondViewController: TopVC? = TopVC()
        secondViewController?.tabBarItem = UITabBarItem(title: "目標設定", image: UIImage(named: "tab-icon-addPlan"), tag: 2)
        viewControllers.append(secondViewController!)

        let thirdViewController: TopVC? = TopVC()
        thirdViewController?.tabBarItem = UITabBarItem(title: "自己管理", image: UIImage(named: "tab-icon-myList"), tag: 3)
        viewControllers.append(thirdViewController!)

        let fourthViewController: TopVC? = TopVC()
        fourthViewController?.tabBarItem = UITabBarItem(title: "マイページ", image: UIImage(named: "tab-icon-myPage"), tag: 4)
        viewControllers.append(fourthViewController!)

        tabBarController = UITabBarController()
        tabBarController?.setViewControllers(viewControllers, animated: false)
        window?.rootViewController = tabBarController

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

