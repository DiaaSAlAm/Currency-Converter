//
//  CurrencyConverterRouter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit
 
class CurrencyConverterRouter: CurrencyConverterRouterProtocol { //Router is only one take dicret instance
    

    weak var viewController: UIViewController?
    
    static func createModule(currencyListModel: CurrencyListModel) -> UIViewController {
        let view = UIStoryboard(name: StoryboardNames.currency, bundle: nil).instantiateViewController(withIdentifier: "\(CurrencyConverterVC.self)") as! CurrencyConverterVC
        let interactor = CurrencyConverterInteractor()
        let router = CurrencyConverterRouter()
        let presenter = CurrencyConverterPresenter(view: view, interactor: interactor, router: router,currencyListModel: currencyListModel)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

}
