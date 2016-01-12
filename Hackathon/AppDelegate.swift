//
//  AppDelegate.swift
//  Hackathon
//
//  Created by Lukas Theiler on 12.01.16.
//  Copyright © 2016 Lukas Theiler. All rights reserved.
//

import UIKit

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate, EventListener {

    var window: UIWindow?    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if (UIApplication.instancesRespondToSelector(Selector("registerUserNotificationSettings"))) {
            application.registerUserNotificationSettings(
                UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil))
        }
        
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum);
        
        let config = LBSConfig()
        config.server="https://interactor.swisscom.ch"
        config.apiKey="c7779802-3f90-439c-95de-2a2549f8c4a5" // set your api-key
        config.logging = false
        
        let interactor = Interactor.sharedInteractor()
        interactor.configureWithConfig(config)
        interactor.startInteractor()
        
        interactor.registerEventListener(self)
        
        return true
    }
    
    func eventTriggered(data: LBSEvent!) {
        self.notify(data.name)
        
    }
    
    func notify(text: String) {
        let localNotification = UILocalNotification();
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1);
        localNotification.alertBody = text;
        localNotification.timeZone = NSTimeZone.defaultTimeZone();
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification);
    }
    
    func application(application: UIApplication,
        performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
            if application.applicationState == UIApplicationState.Inactive ||
                application.applicationState == UIApplicationState.Background {
                    self.notify("Background fetch triggered: \(NSDate())")
                    Interactor.sharedInteractor().synchroniseData()
                    completionHandler(UIBackgroundFetchResult.NewData)
            }
            else {
                completionHandler(UIBackgroundFetchResult.NoData)
            }
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    func applicationWillTerminate(application: UIApplication) {
    }
}
