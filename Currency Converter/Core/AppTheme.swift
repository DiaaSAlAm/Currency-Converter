//
//  AppTheme.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

/// Apply application theme and colors
class AppTheme {
    
    static func apply() {
        navigationBarStyle() 
    }
    
    private static func navigationBarStyle() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 14) ?? UIFont()
        ]
        UINavigationBar.appearance().isTranslucent = false
    }
    
     
}
