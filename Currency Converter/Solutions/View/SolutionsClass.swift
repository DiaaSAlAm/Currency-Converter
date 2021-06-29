//
//  SolutionsClass.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

class SolutionsClass: NSObject {
    
    //MARK: - Properties
    var viewModel: SolutionsViewModelProtocol! = SolutionsViewModel()
     
     
    func viewDidLoad(){
        viewModel.viewDidLoad()
        bind(to: viewModel)
    }
    
    private func bind(to viewModel: SolutionsViewModelProtocol) {
        viewModel.arithmeticOperatorsValue.observe(on: self) {  print("arithmetic Operators equal ->",  $0)}
        viewModel.checkIfAnagramsValue.observe(on: self) {  print("check If Anagrams ->",  $0)}
        viewModel.recursiveFibonacciNumberValue.observe(on: self) {  print("recursive Fibonacci Number ->",  $0)}
        viewModel.iterativeFibonacciNumberValue.observe(on: self) {  print("iterative Fibonacci Number ->",  $0)}
    }
}
