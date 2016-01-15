//
//  AppDelegate.swift
//  InteractorSwift

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, EventListener {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if (UIApplication.instancesRespondToSelector(Selector("registerUserNotificationSettings"))) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil))  // types are UIUserNotificationType members
        }
        
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum);

        let config = LBSConfig()
        config.apiKey="be6ea8b1-321c-433d-a8f9-bd6bdc11bef4"
        config.server="https://interactor.swisscom.ch"
        config.logging = true
        
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
        //TODO Launch notification
        let localNotification = UILocalNotification();
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1);
        localNotification.alertBody = text;
        localNotification.timeZone = NSTimeZone.defaultTimeZone();
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification);

    }
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        if application.applicationState == UIApplicationState.Inactive || application.applicationState == UIApplicationState.Background {
            self.notify("Background fetch triggered: \(NSDate())")
            self.synchroniseInteractorData()
            completionHandler(UIBackgroundFetchResult.NewData)
        }
        else {
            completionHandler(UIBackgroundFetchResult.NoData)
        }
    }
    
    func synchroniseInteractorData() {
        Interactor.sharedInteractor().synchroniseData()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

