//
//  CurrencyListPresenter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

class CurrencyListPresenter: CurrencyListPresenterProtocol,CurrencyListInteractorOutputProtocol {
    
    //MARK: - Properties
    weak var view: CurrencyListViewProtocol?
    private let interactor: CurrencyListInteractorInputProtocol
    private var router: CurrencyListRouterProtocol
    private var rates: [String: Double]?
    var numberOfRow: Int { return rates?.count ?? 0}
    var baseCurrency: String?
    
    init(view: CurrencyListViewProtocol, interactor: CurrencyListInteractorInputProtocol, router: CurrencyListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getLatestCurrencyRates()
    }
    
    func successRequest(rates: [String: Double], base: String) {
        self.rates = rates
        baseCurrency = base
        view?.hideLoadingIndicator()
        view?.successRequest()
    }
    
    func failedRequest(withError error: String) {
        view?.hideLoadingIndicator()
        view?.failedRequest()
        view?.showMessage(message: error, messageKind: .error)
    }
    
    func showMessage(message: String) {
        view?.hideLoadingIndicator()
        view?.showMessage(message: message, messageKind: .success)
    }
    
    func configureCell(cell: CurrencyListCellViewProtocol, indexPath: IndexPath) {
        guard let rate = rates else {return}
        let currencyIndex = returnCurrencyName_RateIndex(rate, indexPath: indexPath)
        let viewModel = CurrencyListViewModel(currencyName: currencyIndex.0  , currencyRate: currencyIndex.1)
        cell.configureCell(viewModel: viewModel)
    }
    
    func navigateToCurrencyConverter(_ indexPath: IndexPath){
        guard let rate = rates else {return}
        let currencyIndex = returnCurrencyName_RateIndex(rate, indexPath: indexPath)
        let currencyListModel = CurrencyListModel(currencySelectedName: currencyIndex.0 , currencySelectedRate: currencyIndex.1, baseCurrencyName: baseCurrency ?? "none")
        router.navigateToCurrencyConverter(currencyListModel: currencyListModel)
    }
    
    func returnCurrencyName_RateIndex(_ rates: [String: Double], indexPath: IndexPath) -> (String, Double) {
        let startIndex = rates.startIndex
        let index = rates.index(startIndex, offsetBy: indexPath.row)
        let currencyName = rates.keys[index]
        let currencyRate = rates.values[index]
        return (currencyName,currencyRate)
    }
     
}
