//
//  CurrencyAPI.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

protocol CurrencyAPIProtocol {
    func getLatestCurrencyRates(completion: @escaping (Result<BaseResponse<[String: Double]>?, NSError>) -> Void)
}


class CurrencyAPI: BaseAPI<CurrencyNetwork>, CurrencyAPIProtocol {
    
    //MARK:- Requests
    func getLatestCurrencyRates(completion: @escaping (Result<BaseResponse<[String: Double]>?, NSError>) -> Void) {
        self.fetchData(target: .getLatestCurrencyRates, responseClass: BaseResponse<[String: Double]>.self, completion: completion)
    }
}
