//
//  XCTUITest_SwiftUITests.swift
//  XCTUITest_SwiftUITests
//
//  Created by Ravikumar on 08/02/22.
//

import XCTest

@testable import XCTUITest_Swift

class XCTUITest_SwiftUITests: XCTestCase {

    private var app:XCUIApplication!
    
    private var firstnameTextField:XCUIElement!
    private var lastnameTextField:XCUIElement!
    private var emailTextField:XCUIElement!

    private var passwordTextField:XCUIElement!
    private var repeatPasswordTextField:XCUIElement!
    private var signupButton:XCUIElement!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        try super.setUpWithError()
        app = XCUIApplication()
//        app.launchArguments = ["-skipSurvey","-debugServer"]
//        app.launchEnvironment = ["signupUrl":"http://appsdeveloperblog.com/api/v2/signup-mock-service/users",
//                                 "InAppPurchasesEnabled":"true",
//                                 "inAppAdsEnabled":"true"]
        
        app.launch()
        
         firstnameTextField = app.textFields["fname"]
         lastnameTextField = app.textFields["lname"]
         emailTextField = app.textFields["email"]
         passwordTextField = app.secureTextFields["password"]
         repeatPasswordTextField = app.secureTextFields["repeatpassword"]
         signupButton = app.buttons["signupbutton"]
        
        
//        //...Device Orientation
//        let device = XCUIDevice.shared
//        device.orientation = .landscapeRight
//        device.press(.home)
//
//        //...Activate Siri
//        let siri = device.siriService
//        siri.activate(voiceRecognitionText: "")
        
        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstnameTextField = nil
        lastnameTextField = nil
        emailTextField = nil
        passwordTextField = nil
        repeatPasswordTextField = nil
        signupButton = nil
      try super.tearDownWithError()
    }

    func testViewController_WhentappedConnectedorNot_isEnabledorNot() throws {
        // UI tests must launch the application that they test.
        //... Given Field name are accessbility identifiers
        XCTAssertTrue(firstnameTextField.isEnabled, "firstnameTextField Textfield is not connecte to the interface")
        XCTAssertTrue(lastnameTextField.isEnabled, "lastnameTextField Textfield is not connecte to the interface")
        XCTAssertTrue(emailTextField.isEnabled, "emailTextField Textfield is not connecte to the interface")
        XCTAssertTrue(passwordTextField.isEnabled, "passwordTextField Textfield is not connecte to the interface")
        XCTAssertTrue(repeatPasswordTextField.isEnabled, "repeatPasswordTextField Textfield is not connecte to the interface")
        XCTAssertTrue(signupButton.isEnabled, "signupButton Textfield is not connecte to the interface")
    }

    func testViewController_WhenInvalidFormSubitted_PresentsErrorAlertDialog() {
        
        //... Arrange
        //... Given Field name are accessbility identifiers
        firstnameTextField.tap()
        firstnameTextField.typeText("Rk")
        
        lastnameTextField.tap()
        lastnameTextField.typeText("Kumar")
        
        emailTextField.tap()
        emailTextField.typeText("rk@test.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("123")
                
        //... Act
        signupButton.tap()
        
        //... Take a Perticular XCUIElement Screenshot
        let emailScreenShot = emailTextField.screenshot()
        let emailAttachment = XCTAttachment(screenshot: emailScreenShot)
        emailAttachment.name = "ScreenShot of Email" //...ScreenShot name
        emailAttachment.lifetime = .keepAlways
        add(emailAttachment)
        
        //...Way1:: Take a Complete Screenshot
        let currentAppwindo = app.screenshot()
    //    let currentAppwindo = XCUIScreen.main.screenshot() //...Way2:: Take a Complete Screenshot
        let currentAppwindowAttachment = XCTAttachment(screenshot: currentAppwindo)
        currentAppwindowAttachment.name = "Screenshot of Current App Window"
        add(currentAppwindowAttachment)
        
        //... Assert
        //..... This is like Expectations in UnitTest Cases, This will use for the sync and async, based on network put timeout seconds
        XCTAssertTrue(app.alerts["errorAlertDialoge"].waitForExistence(timeout: 1), "An Error Alert dailoge was not presented when invalid singup form was submitted")
        
        //      XCTAssertTrue(app.alerts["errorAlertDialoge"].exists, "An Error Alert dailoge was not presented when invalid singup form was submitted")
    }
    
    
    //... This is for Button tapping and moving into next viewcontroller
//    func testCreateAccountbutton_whenTapped_PresentSignupViewcontroller() throws {
//
//        let app = XCUIApplication()
//        app.launch()
//
//        app.buttons["CreateAccountButton"].tap()
//        XCTAssertTrue(app.otherElements["SingupViewController"].waitForExistence(timeout: 1), "The SignupViewController was not presented when the Create Account was tapped")
//    }
    
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
