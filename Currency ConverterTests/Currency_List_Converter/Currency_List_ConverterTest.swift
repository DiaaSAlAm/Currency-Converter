//
//  Currency_List_ConverterTest.swift
//  Currency ConverterTests
//
//  Created by Diaa SAlAm on 6/30/21.
//

import XCTest
@testable import Currency_Converter

class Currency_List_ConverterTest: XCTestCase {
    
    var presenter: CurrencyListPresenter?
    let mockInteractor = CurrencyListInteractor()
    let mockRouter = MockRouter()
    let fakeRates = ["GBP": 0.4, "AUD": 0.28]
    let fakeBase = "EUR"
    var mockInterface = MockInterface()
     
    override func setUp() {
        presenter = CurrencyListPresenter(view: mockInterface, interactor: mockInteractor, router: mockRouter)
        mockInterface.presenter = presenter
        mockInteractor.presenter = presenter
    }
    
    func testRowsCountIs3() {
        presenter?.successRequest(rates: fakeRates, base: fakeBase)
        XCTAssertEqual(presenter?.numberOfRow, 2)
    }
    
    func testRowsAtIndexIsInjectedModel() {
        let indexPath = IndexPath(row: 0, section: 0)
        let currency = presenter?.returnCurrencyName_RateIndex(fakeRates, indexPath: indexPath)
        XCTAssertEqual(currency?.0, "GBP")
        XCTAssertEqual(currency?.1, 0.4)
    }
    
    func testRowsEmptyShouldShowError() {
        presenter?.failedRequest(withError: "")
        XCTAssertEqual(mockInterface.shouldHideLoadingIndicator,true)
        XCTAssertEqual(mockInterface.shouldLoadList,false)
    }
     
    
    func testSelectedRows() {
        presenter?.successRequest(rates: fakeRates, base: fakeBase)
        let indexPath = IndexPath(row: 0, section: 0)
        presenter?.navigateToCurrencyConverter(indexPath)
        XCTAssertEqual(mockRouter.currencyListModel?.currencySelectedName, "GBP")
    }
    
    override func tearDown() {
        super.tearDown()
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
        }
    }

}

final class MockRouter: CurrencyListRouterProtocol {
    var currencyListModel: CurrencyListModel?
      
    func navigateToCurrencyConverter(currencyListModel: CurrencyListModel) {
        self.currencyListModel = currencyListModel
    }
}


final class MockInterface: CurrencyListViewProtocol {
     
    
    var presenter: CurrencyListPresenterProtocol!
    var shouldLoadList = false
    var shouldShowLoadingIndicator = false
    var shouldHideLoadingIndicator = false
    var shouldShowMessage = false
    
    func showLoadingIndicator() {
        shouldShowLoadingIndicator = true
    }
    
    func hideLoadingIndicator() {
        shouldHideLoadingIndicator = true
    }
    
    func successRequest() {
        shouldLoadList = true
    }
    
    func failedRequest() {
        shouldLoadList = false
    }
    
    func showMessage(message: String, messageKind: ToastMessageKind) {
        shouldShowMessage = true
    }
}
