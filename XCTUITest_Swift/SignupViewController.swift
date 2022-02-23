//
//  SignupViewController.swift
//  XCTUITest_Swift
//
//  Created by Ravikumar on 08/02/22.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet weak var txtf_firstname: UITextField!
    @IBOutlet weak var txtf_lastname: UITextField!
    @IBOutlet weak var txtf_email: UITextField!
    @IBOutlet weak var txtf_password: UITextField!
    @IBOutlet weak var txtf_repeatPassword: UITextField!
    
    
    @IBOutlet weak var btn_Signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        //... If nothing is read it from process info then sue commandline arguments
//        #if DEBUG
//        if  CommandLine.arguments.contains("-skipSurvey"){
//            print("Skipping survey page")
//        }
//        #endif
//
//        //... This is much more faster than the Commandline arhuments and more advanced
//        #if DEBUG
//        if  ProcessInfo.processInfo.arguments.contains("-skipSurvey"){
//            print("Skipping survey page")
//        }
//        #endif
        
        //...Access the launch arguments data once got the data we can call urlsessoin with this url
   //    print(ProcessInfo.processInfo.environment["signupUrl"])
    }
    
    @IBAction func btn_SignupAction(_ sender: Any) {
   
        let alert = UIAlertController(title: "Error", message: "Your request could not processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialoge"
            self.present(alert, animated: true, completion: nil)
        }
    
    }
    
    //... This code is for moving one viewcontroller to another controller UITesting written
//    @IBAction func btn_createSignupAccount(_ sender: Any) {
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let signupViewController = storyboard.instantiateViewController(identifier: "SingupViewController")
//            signupViewController.view.accessibilityIdentifier = "SingupViewController"
//    //        self.present(signupViewController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(signupViewController, animated: true)
//        }
    
}







































































