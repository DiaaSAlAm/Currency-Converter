//
//  Environment.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let apiKey = "API_KEY"
            static let appBundleId = "APP_BUNDLE_ID"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API KEY not set in plist for this environment")
        }
        return apiKey
    }()
    
    static let appBundleId: String = {
        guard let appBundleId = Environment.infoDictionary[Keys.Plist.appBundleId] as? String else {
            fatalError("APP BUNDLE ID  not set in plist for this environment")
        }
        return appBundleId
    }()
}
