//
//  CurrencyList.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

protocol CurrencyListViewProtocol: class { //View Conteroller
    var presenter: CurrencyListPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func successRequest()
    func failedRequest()
    func showMessage(message: String, messageKind: ToastMessageKind)
}

protocol CurrencyListPresenterProtocol: class { // Logic
    var view: CurrencyListViewProtocol? { get set }
    var numberOfRow: Int {get}
    var baseCurrency: String? {get}
    func viewDidLoad()
    func navigateToCurrencyConverter(_ indexPath: IndexPath)
    func configureCell(cell: CurrencyListCellViewProtocol, indexPath: IndexPath)
}

protocol CurrencyListInteractorInputProtocol: class { // func do it from presenter
     var presenter: CurrencyListInteractorOutputProtocol? { get set }
    func getLatestCurrencyRates()
}

protocol CurrencyListInteractorOutputProtocol: class { // it's will call when interactor finished
    func successRequest(rates: [String: Double], base: String)
    func failedRequest(withError error: String)
    func showMessage(message: String)
}

protocol CurrencyListRouterProtocol { // Navigation , Alert
    func navigateToCurrencyConverter(model: CurrencyListModel)
}

protocol CurrencyListCellViewProtocol { // it's will call when register cell
    func configureCell(viewModel: CurrencyListViewModel)
}


