//
//  AppDelegate.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 7/22/18.
//  Copyright © 2018 23andMe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectPropertyLoader

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// Bootstrapped singleton that provides service types (ie. protocols) app wide.
    /// Held strongly here at app initialization and weakly by routers as the access
    /// point to the main application wireframe.
    private var wireframe: WireframeType?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        do {
            // load our container assemblies that will register their service types to container
            let assembler = try Assembler(assemblies: [
                WireframeAssembly(),
                RootAssembly()
            ])
            
            // load properties from json files to make available during container resolution of dependencies
            try assembler.applyPropertyLoader(
                JsonPropertyLoader(
                    bundle: Bundle.main,
                    name: "properties"
                )
            )
            
            // one route provider to govern them all
            self.wireframe = assembler.resolver.resolve(WireframeType.self)
            self.wireframe?.setAssembler(assembler)
            
            // route to root which is persistent as the base of an app during the entirety of application run.
            let router = self.wireframe?.route(RootRouterType.self)
            
            // create our window display and load the root view into it
            let window = UIWindow(frame: UIScreen.main.bounds)
            self.window = router!.loadView(in: window)
        } catch {
            print("unable to load properties")
        }
        
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

