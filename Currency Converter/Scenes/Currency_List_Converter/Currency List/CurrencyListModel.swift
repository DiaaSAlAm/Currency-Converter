//
//  CurrencyListModel.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//
 
import Foundation 

struct CurrencyListModel {
    var currencySelectedName: String?
    var currencySelectedRate: Double?
    var baseCurrencyName: String?
    
    init(currencySelectedName: String,currencySelectedRate: Double,baseCurrencyName: String) {
        self.currencySelectedName = currencySelectedName
        self.currencySelectedRate = currencySelectedRate
        self.baseCurrencyName = baseCurrencyName
    }
}

struct CurrencyListViewModel {
    var currencyName: String?
    var currencyRate: Double?
    
    init(currencyName: String,currencyRate: Double) {
        self.currencyName = currencyName
        self.currencyRate = currencyRate
    }
} 
