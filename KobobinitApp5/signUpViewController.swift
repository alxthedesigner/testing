
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
    var errorMess : String!
    
    lazy var userFirstName = firstNameTextField.text
    lazy var userLastName = lastNameTextField.text
    lazy var userEmail = emailTextField.text
    lazy var userPassword = passwordTextField.text
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func signUpSubmissionButton(_ sender: UIButton) {
        success2 = true

        if(emailTextField.text == "" || firstNameTextField.text == "" || lastNameTextField.text == ""){
                errorMess = "Email or name empty"
                success2 = false
                self.signUpErrorLabel.text = "\(errorMess)"
                return
        }
        if(passwordTextField.text != confirmPasswordTextField.text){
                success2 = false
                errorMess = "Passwords do not match"
                self.signUpErrorLabel.text = "\(errorMess)"
                return
        }
        if((passwordTextField.text?.count)! < 8){
            success2 = false
            errorMess = "Password must be at least 8 characters"
            self.signUpErrorLabel.text = "\(errorMess)"
            return
            
            }else{
                success2 = true
                performSegue(withIdentifier: "alreadyHasAccount", sender: self)
                self.signUpErrorLabel.text = ""
                coreDataViewController.saveUserToCoreData(firstName: userFirstName!, lastName: userLastName!, email: userEmail!, password: userPassword!)
                user = coreDataViewController.fetchUserInfo()
                print(user)
                print(success2)
        }
    }
    
    func saveUserToFirebase(){
        
        
    }
    
    @IBAction func alreadyHasAccountButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
