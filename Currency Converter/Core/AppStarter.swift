//
//  AppStarter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

/// AppStarter here you can handle everything before letting your app starts
final class AppStarter {
    static let shared = AppStarter()
    
    private init() {}
    
    func start() {
        AppTheme.apply()
    }
     
     
}
