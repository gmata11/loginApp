//
//  UITesting.swift
//  UITesting
//
//  Created by Gerard Mata Carrera on 27/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import XCTest

class UITesting: XCTestCase {
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValid(){
        
        let app = XCUIApplication()
        app.buttons["Don't have an account? Sign Up"].tap()
        sleep(1)
        app.buttons["Already have an account? Sign In"].tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test")
        app.textFields["Email"].buttons["Clear text"].tap()
        emailTextField.typeText("test")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("test")
        app.secureTextFields["Password"].buttons["Clear text"].tap()
        passwordSecureTextField.typeText("test")
        
        let logInButton = app.buttons["Log in"]
        logInButton.tap()
        app.alerts["Wrong user"].buttons["OK"].tap()
        emailTextField.tap()
        emailTextField.clearText()
        emailTextField.typeText("G")
        passwordSecureTextField.tap()
        passwordSecureTextField.clearText()
        passwordSecureTextField.typeText("1234")
        logInButton.tap()
        sleep(1)
        app.buttons["LogOut"].tap()
        
        
        
    }
    
    
    
    

}

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
}
