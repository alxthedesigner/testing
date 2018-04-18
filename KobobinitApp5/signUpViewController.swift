//
//  signUpViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 4/17/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
  
    
    @IBOutlet weak var signUpErrorLabel: UILabel!
    var success2 : Bool = false;
    var user:[Users]? = nil
    
    lazy var userFirstName = firstNameTextField.text
    lazy var userLastName = lastNameTextField.text
    lazy var userEmail = emailTextField.text
    lazy var userPassword = passwordTextField.text
    
    lazy var fields: [String] = [userFirstName!, userLastName!, userEmail!, userPassword!, confirmPasswordTextField.text!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitSignUpButton(_ sender: UIButton) {
        
        user = coreDataViewController.fetchUserInfo()
        
        for i in user!{
            if(firstNameTextField.text != "" && lastNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != ""){
                
                success2 = true
                performSegue(withIdentifier: "alreadyHasAccount", sender: self)
                self.signUpErrorLabel.text = ""
                coreDataViewController.saveUserInfo(firstName: userFirstName!, lastName: userLastName!, email: userEmail!, password: userPassword!)
                
                print(user)
                
                
            }else{
                print("Invalid Credintials")
                self.signUpErrorLabel.text = "Invalid Login Info"
                success2 = false
            }
            
        }
        
    }
    
    
    @IBAction func alreadyHasAccountButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func allFieldsFilled() -> Bool{
        
        if(userFirstName == "" || userLastName == ""){
            print("First or last name empty")
            return false
        }
        if(userEmail == ""){
            print("Email empty")
            return false
        }
        if(userPassword == "" || confirmPasswordTextField.text == ""){
            print("Pass or confirm password empty")
            return false
        }
        
        return true
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if(identifier == "alreadyHasAccount"){
            if(success2 != true){
                return false
            }else{
                return true
            }
        }
        
        return true
    }
    
}
