//
//  CurrencyListCell.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit

class CurrencyListCell: UICollectionViewCell, CurrencyListCellViewProtocol {

    @IBOutlet private weak var currencyNameLabel: UILabel!
    @IBOutlet private weak var currencyRateLabel: UILabel!
    
    func configureCell(viewModel: CurrencyListViewModel) {
        let rate = viewModel.currencyRate ?? 0
        currencyNameLabel.text = viewModel.currencyName
        currencyRateLabel.text = String(rate.rounded(toPlaces: 2))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


