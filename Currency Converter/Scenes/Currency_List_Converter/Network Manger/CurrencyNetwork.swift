//
//  CurrencyNetwork.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

enum CurrencyNetwork {
    case getLatestCurrencyRates
}

extension CurrencyNetwork: TargetType {
    
    var baseURL: String {
        return Environment.rootURL.absoluteString
    }
    
    var accessKey: String {
        return Environment.apiKey
    }
    
    var path: String {
        switch self {
        case .getLatestCurrencyRates:
            return "latest"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return  [:]
        }
    }
    
    var task: Task {
        switch self {
        case .getLatestCurrencyRates:
            return .requestParametersURLEncoding(parameters: ["access_key" : accessKey])
        }
    }
}
