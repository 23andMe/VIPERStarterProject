//
//  RootLocalization.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

import Foundation

fileprivate let tableName = "Root"
struct RootLocalization {

    static var titleText: String {
        return "root.view.title.text".localized(tableName: tableName)
    }
}
