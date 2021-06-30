//
//  CurrencyConverterVC.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit
 
class CurrencyConverterVC: UIViewController, CurrencyConverterViewProtocol {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var baseCurrencyValueTextField: UITextField!
    @IBOutlet private weak var baseCurrencyNameLabel: UILabel!
    @IBOutlet private weak var currencySelectedRateLabel: UILabel!
    @IBOutlet private weak var currencySelectedNameLabel: UILabel!
    
    //MARK: - Properties
    var presenter: CurrencyConverterPresenterProtocol!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIData()
    }
    
    func showMessage(message: String, messageKind: ToastMessageKind) {
        DispatchQueue.main.async {
            ToastManager.shared.showMessage(messageKind: messageKind, message: message)
        }
    }
    
    private func setUIData(){
        currencySelectedNameLabel.text = presenter.currencyListModel.currencySelectedName
        currencySelectedRateLabel.text = String(presenter.currencyListModel.currencySelectedRate?.rounded(toPlaces: 2) ?? 0.00)
        baseCurrencyNameLabel.text = presenter.currencyListModel.baseCurrencyName
        baseCurrencyValueTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        baseCurrencyValueTextField.becomeFirstResponder()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let currencySelectedRate = presenter.currencyListModel.currencySelectedRate else {
            showMessage(message: ConstatnsToastMessage.genericErrorMessage, messageKind: .error)
            return
        }
        guard let text = textField.text?.replacingOccurrences(of: " ", with: "") else {
            currencySelectedRateLabel.text = String(currencySelectedRate.rounded(toPlaces: 2))
            return
        }
        guard let baseValue = Double(text) else {
            showMessage(message: ConstatnsToastMessage.genericErrorMessage, messageKind: .error) // "This value is invalid"
            return 
        }
        let value = presenter.multiply(baseValue, currencySelectedRate).rounded(toPlaces: 2)
        currencySelectedRateLabel.text = String(value)
    }
     
}
