//
//  SolutionsViewModel.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

final class SolutionsViewModel: SolutionsViewModelProtocol {
    
    //MARK: - Properties, OUTPUT
    var arithmeticOperatorsValue: Observable<Int> = Observable(0)
    var checkIfAnagramsValue: Observable<Bool> = Observable(false)
    var recursiveFibonacciNumberValue: Observable<[Int]> = Observable([])
    var iterativeFibonacciNumberValue: Observable<[Int]> = Observable([])
    
    //MARK: - Life Cycle, INPUT
    func viewDidLoad() {
        addArithmeticOperators()
        checkIfAnagrams( "debit card", "bad credit")
        recursiveApproach(9)
        iterativeApproach(9)
    }
    
    //I.​ ​Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions true. You can use any parentheses you’d like.
    //3 1 3 9 = 12
    func addArithmeticOperators() {
        let num = (-3 + 1) * (3-9)
        arithmeticOperatorsValue.value = num
    }
    
    //II.​ ​Write a function/method utilizing Swift to determine whether two strings are anagrams or not (examples of anagrams: debit card/bad credit, punishments/nine thumps, etc.)
    
    func checkIfAnagrams(_ lhs: String,_ rhs: String) {
        let first = lhs.replacingOccurrences(of: " ", with: "")
        let second = rhs.replacingOccurrences(of: " ", with: "")
        let value = first.lowercased().sorted() == second.lowercased().sorted() 
        checkIfAnagramsValue.value = value
    }
    
    //III.​ ​Write a method in Swift to generate the nth Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34)
    // A.​ ​recursive approach
    // B.​ ​iterative approach
    
    func recursiveApproach(_ fibonacciNumber: Int) {
        var (a, b) = (0, 1)
        var sequenceNumbers = [Int]()
        var inner: (Int) -> () = { _ in }
        inner = { val in
            (a, b) = (b, a + b)
            sequenceNumbers.append(a)
            if val > 1 {
                inner(val - 1)
            }
        }
        inner(fibonacciNumber)
        recursiveFibonacciNumberValue.value = sequenceNumbers
    }
    
    func iterativeApproach(_ fibonacciNumber: Int) {
        let sequenceNumbers = sequence(first: (0, 1), next: {($1, $0 + $1)}).prefix(fibonacciNumber).map({$1})
        iterativeFibonacciNumberValue.value = sequenceNumbers
    }
}
