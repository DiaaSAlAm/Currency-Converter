//
//  AppStarter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

/// AppStarter here you can handle everything before letting your app starts
final class AppStarter {
    static let shared = AppStarter()
    private let window = SceneDelegate.shared?.window
    private let solutionsClass = SolutionsClass()
    
    private init() {}
    
    func start() {
        AppTheme.apply()
        solutionsClass.viewDidLoad()
        setRootViewController()
    }
    
    private func setRootViewController() {
        window?.rootViewController = CurrencyListRouter.createModule()
        window?.makeKeyAndVisible()
    }
     
}
