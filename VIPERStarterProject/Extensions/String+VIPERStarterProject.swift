//
//  String+VIPERStarterProject.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 7/22/18.
//  Copyright © 2018 23andMe. All rights reserved.
//

import Foundation

extension String {
    /// Will localize the string by key for a provided table name.
    ///
    /// - Parameters:
    ///   - key: the key for lookup in strings file
    ///   - tableName: corresponds to the name of string file
    ///   - value: optional value that defaults to empty string
    ///   - bundle: optional bundle to specify; otherwise main bundle
    ///   - comment: optional comment to associate with localized string entry
    /// - Returns: a localized string
    func localized(
        tableName: String,
        value: String = "",
        bundle: Bundle = Bundle.main,
        comment: String = "") -> String {
        
        return NSLocalizedString(
            self,
            tableName: tableName,
            bundle: bundle,
            value: value,
            comment: comment
        )
    }
}
