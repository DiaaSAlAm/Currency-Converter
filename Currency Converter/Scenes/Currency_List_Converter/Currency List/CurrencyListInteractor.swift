//
//  CurrencyListInteractor.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

class CurrencyListInteractor: CurrencyListInteractorInputProtocol {

    weak var presenter: CurrencyListInteractorOutputProtocol?
    private let currencyAPI: CurrencyAPIProtocol = CurrencyAPI()
    
    func getLatestCurrencyRates(){
        currencyAPI.getLatestCurrencyRates { [weak self] (result) in
          guard let self = self else {return}
          switch result {
          case .success(let response):
            guard let rates = response?.rates, rates.count != 0, response?.success == true else {
                self.presenter?.failedRequest(withError: response?.error?.type ?? ConstatnsToastMessage.genericErrorMessage)
                return
            }
            guard let base  = response?.base else {
                self.presenter?.failedRequest(withError: response?.error?.type ?? ConstatnsToastMessage.genericErrorMessage)
                return
            }
            self.presenter?.successRequest(rates: rates, base: base)
          case .failure(let error):
              let err = error.localizedDescription
            self.presenter?.failedRequest(withError: err)
          }
        }
    }
     
}
