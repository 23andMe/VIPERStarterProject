//
//  RouteType.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 7/22/18.
//  Copyright © 2018 23andMe. All rights reserved.
//
import UIKit

/// Generic route type protocol that all routers conform to.
protocol RouteType: class {
    
    // hold weakly
    var wireframe: WireframeType? { get set }
    
    /// Will hold the presented view controller of a given route.
    var presentedViewController: UIViewController? { get set }
}

