//
//  SolutionsTests.swift
//  Currency ConverterTests
//
//  Created by Diaa SAlAm on 6/29/21.
//

import XCTest
@testable import Currency_Converter

class SolutionsTests: XCTestCase {
    var viewModel: SolutionsViewModelProtocol? = SolutionsViewModel()
    
    override func setUp() {
        viewModel?.addArithmeticOperators()
         
    }
    
    func testCheckIfAnagramsFunctionality() {
        viewModel?.checkIfAnagrams("debit card", "bad credit")
        XCTAssertEqual(viewModel?.checkIfAnagramsValue.value, true)
    }
    
    func testRecursiveApproachFunctionality() {
        viewModel?.recursiveApproach(9)
        XCTAssertEqual(viewModel?.recursiveFibonacciNumberValue.value.count, 9)
        
        viewModel?.recursiveApproach(9)
        XCTAssertEqual(viewModel?.recursiveFibonacciNumberValue.value.last, 34)
    }
    
    
    func testIterativeApproachFunctionality() {
        viewModel?.iterativeApproach(10)
        XCTAssertEqual(viewModel?.iterativeFibonacciNumberValue.value.count, 10)
        
        viewModel?.iterativeApproach(10)
        XCTAssertEqual(viewModel?.iterativeFibonacciNumberValue.value.last, 55)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            viewModel?.iterativeApproach(10)
        }
    }

}

 

