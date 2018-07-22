//
//  RootRouter.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

import UIKit

// MARK: Protocols

/// The Root router type protocol.
protocol RootRouterType: RouteType, RootPresenterToRouterType {
    
    /// Will load this route's view in the provided window and return it after
    /// assigning the view to it.
    ///
    /// - Parameter window: the window that we'll load view into.
    /// - Returns: the loaded window.
    func loadView(in window: UIWindow) -> UIWindow
}

protocol RootPresenterToRouterType {

}

// MARK: Classes

final class RootRouter: RootRouterType {
    
    weak var wireframe: WireframeType?
    weak var presentedViewController: UIViewController?
    
    deinit {
        print("Root router deinit")
    }

    func loadView(in window: UIWindow) -> UIWindow {
        guard let rootViewController = self.wireframe?.resolve(RootViewControllerType.self) else {
            assertionFailure("expected root view controller type to be registered w/ container")
            return window
        }
        window.rootViewController = rootViewController as? UIViewController
        self.presentedViewController = window.rootViewController
        window.makeKeyAndVisible()
        return window
    }
}
