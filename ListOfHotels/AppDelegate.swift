//
//  AppDelegate.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func showHotelDetails(hotel: Hotel) {
        topViewController().showDetails(hotel)
    }
    
    func topViewController() -> MasterViewController {
        let navigationController = self.window!.rootViewController as! UINavigationController
        return navigationController.topViewController as! MasterViewController
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let nc = UINavigationController(rootViewController: MasterViewController())
        window!.rootViewController = nc
        window!.makeKeyAndVisible()
        
        return true
    }
}

