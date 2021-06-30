//
//  CurrencyConverter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit

protocol CurrencyConverterViewProtocol: class { //View Conteroller
    var presenter: CurrencyConverterPresenterProtocol! { get set }
    func showMessage(message: String, messageKind: ToastMessageKind)
}

protocol CurrencyConverterPresenterProtocol: class { // Logic
    var view: CurrencyConverterViewProtocol? { get set }
    var currencyListModel: CurrencyListModel { get }
    func multiply(_ lhs: Double,_ rhs: Double) -> Double
}

extension CurrencyConverterPresenterProtocol {
    func multiply(_ lhs: Double,_ rhs: Double) -> Double{
        return (lhs * rhs)
    }
}

// func do it from presenter
protocol CurrencyConverterInteractorInputProtocol: class {
     var presenter: CurrencyConverterInteractorOutputProtocol? { get set }
}

// it's will call when interactor finished
protocol CurrencyConverterInteractorOutputProtocol: class { }

//Navigation , Alert
protocol CurrencyConverterRouterProtocol {}
