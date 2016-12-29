//
//  AppDelegate.swift
//  BrowseMeetup
//
//  Created by Simon Ng on 28/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window                      = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor          = UIColor.white
        
        let feedVC  = MeetupFeedViewController()
        let locationService = LocationService()
        let meetupService = MeetupService()
        
        let dataManager = MeetupFeedDataManager(meetupService: meetupService, locationService: locationService)
        let interactor = MeetupFeedInteractor()
        interactor.dataManager = dataManager
        interactor.output = feedVC
        
        feedVC.handler = interactor
        
        let feedNavCtrl = UINavigationController(rootViewController: feedVC)
        window.rootViewController  = feedNavCtrl
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}
