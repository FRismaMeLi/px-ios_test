//
//  OneTapTests.swift
//  MercadoPagoSDKExampleSwiftUITests
//
//  Created by Demian Tejo on 13/11/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import XCTest

class OneTapTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
         super.tearDown()
    }
    
    func onetapPreSet() -> OneTapScreen {
        return MainScreen()
            .tapConfigurationsButton()
            .changeAccountMoneySwitch()
            .changePaymentPluginSwitch()
            .tapApplyConfigurationsButton()
            .tapClearButton()
            .fillAccessToken("TEST-1458038826212807-062020-ff9273c67bc567320eae1a07d1c2d5b5-246046416")
            .fillPublicKey("TEST-4763b824-93d7-4ca2-a7f7-93539c3ee5bd")
            .fillPreferenceId("242624092-2a26fccd-14dd-4456-9161-5f2c44532f1d")
            .tapCheckoutOptionForOneTap()
    }
 
    func testPayWithAccountMoneyWhitoutScrolling() {
        _ = onetapPreSet()
        .tapPayButtonForAnyCongrats()
    }
    
    func testPayWithAccountMoneyWithScrolling() {
        _ = onetapPreSet()
            .swipeCardLeft()
            .swipeCardRight()
            .tapPayButtonForAnyCongrats()
    }
    
    func testPayWithCreditCard() {
        _ = onetapPreSet()
            .swipeCardLeft()
            .tapPayButtonForCVV()
        .completeCVVAndContinueToAnyCongrats("123")
        
    }
    
    func testPayWithDebitCard() {
        _ = onetapPreSet()
            .swipeCardLeft()
            .swipeCardLeft()
            .tapPayButtonForCVV()
            .completeCVVAndContinueToAnyCongrats("123")
    }
    
    func testPayWithCreditCardChangingInstallments() {
        _ = onetapPreSet()
        // do stuff
        XCUIApplication().scrollViews.otherElements.otherElements["installment_button"].collectionViews.children(matching: .cell).element(boundBy: 1).staticTexts["1x $ 100 Sin interés CFT: 0,00%"].tap()
        
    }
    
}