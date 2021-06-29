//
//  SolutionsViewModelProtocol.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

protocol SolutionsViewModelInput {
    func viewDidLoad()
    func addArithmeticOperators()
    func checkIfAnagrams(_ firstString: String,_ secondString: String)
    func recursiveApproach(_ fibonacciNumber: Int)
    func iterativeApproach(_ fibonacciNumber: Int)
}

protocol SolutionsViewModelOutput {
    var arithmeticOperatorsValue: Observable<Int> { get }
    var checkIfAnagramsValue: Observable<Bool> { get }
    var recursiveFibonacciNumberValue: Observable<[Int]> { get }
    var iterativeFibonacciNumberValue: Observable<[Int]> { get }
}

protocol SolutionsViewModelProtocol: SolutionsViewModelInput, SolutionsViewModelOutput {}
