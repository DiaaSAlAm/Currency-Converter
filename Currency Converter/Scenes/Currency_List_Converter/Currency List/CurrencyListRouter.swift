//
//  CurrencyListRouter.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit
 
class CurrencyListRouter: CurrencyListRouterProtocol {
    //Router is only one take dicret instance
    

    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: StoryboardNames.currency, bundle: nil).instantiateViewController(withIdentifier: "\(CurrencyListVC.self)") as! CurrencyListVC
        let interactor = CurrencyListInteractor()
        let router = CurrencyListRouter()
        let presenter = CurrencyListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToCurrencyConverter(model: CurrencyListModel) {
        print("navigateToCurrencyConverter", model)
    }
    
}
