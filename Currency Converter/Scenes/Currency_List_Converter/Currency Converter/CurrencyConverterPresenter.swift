//
//  CurrencyConverterPresenter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit

class CurrencyConverterPresenter: CurrencyConverterPresenterProtocol, CurrencyConverterInteractorOutputProtocol {
    
    weak var view: CurrencyConverterViewProtocol?
    private let interactor: CurrencyConverterInteractorInputProtocol
    private var router: CurrencyConverterRouterProtocol
    var currencyListModel: CurrencyListModel
    
    init(view: CurrencyConverterViewProtocol, interactor: CurrencyConverterInteractorInputProtocol, router: CurrencyConverterRouterProtocol, currencyListModel: CurrencyListModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.currencyListModel = currencyListModel
    }
     
}
