//
//  AppDelegate.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 7/20/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "This is a test notification"
        localNotification.fireDate = Date(timeIntervalSinceNow: 5)
        UIApplication.shared.scheduleLocalNotification(localNotification)
        
        return true
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .none {
            application.registerForRemoteNotifications()
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(String(format: "%@", deviceToken as CVarArg))
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register:", error)
    }

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

    func application(_ application: UIApplication, performFetchWith completionHandler: (UIBackgroundFetchResult) -> Void) {
        print("Complete");
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "Movie Count : 0"
        localNotification.fireDate = Date(timeIntervalSinceNow: 1)
        UIApplication.shared.scheduleLocalNotification(localNotification)
        completionHandler(UIBackgroundFetchResult.newData)
        
       
        
    }
    
    func getData() -> Void{
        let url = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1ZET4Sf4U3j-8kBuTRVEgk7szsESiwLss6OgaxSLIMik&sheet=Sheet1";
        let request = URLRequest(url: URL(string: url)!);
        
        NSURLConnection.sendAsynchronousRequest(request,queue: OperationQueue.main) {
            (response: URLResponse?, data: Data?, error: Error?) -> Void in
            let annResults: AnyObject? = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject?
            let table = annResults?["Sheet1"] as? NSArray
            //let announcements: [AnnouncementObject]=[];
            //announcements = annResults["table"] as [NSDictionary];
            let localNotification:UILocalNotification = UILocalNotification()
            localNotification.alertAction = "Testing notifications on iOS8"
            localNotification.alertBody = "Movie Count : \(table?.count)"
            localNotification.fireDate = Date(timeIntervalSinceNow: 1)
            UIApplication.shared.scheduleLocalNotification(localNotification)
        }
        
        
    }

}

