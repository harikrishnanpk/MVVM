//
//  hushProUITests.swift
//  hushProUITests
//
//  Created by harikrishnan on 23/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import XCTest

class hushProUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testLoginSuccess() throws{
        // Use recording to get started writing UI tests.
        
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        
        let emailTextField = elementsQuery.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("hari@thehushapp.com")
        
        let passwordSecureTextField = elementsQuery.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)

        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("asdf1234")
        
        let loginStaticText = elementsQuery.staticTexts["Login"]
        XCTAssertTrue(loginStaticText.exists)

        loginStaticText.tap()
        
        let adAstraCell = app.tables.staticTexts["Ad Astra"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: adAstraCell, handler: nil)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    


//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
