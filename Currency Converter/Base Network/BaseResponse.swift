//
//  BaseResponse.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

class BaseResponse<T: Codable>: Codable { 
    var success: Bool?
    var base: String?
    var data: T?
    var rates: [String: Double]?
    var error: BaseError?
}

struct BaseError: Codable {
    var code: Int?
    var type: String?
}
