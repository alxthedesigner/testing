
//
//  signUpViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 4/17/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    

  
    @IBOutlet weak var signUpErrorLabel: UILabel!
    var success : Bool = false;
    var user:[Users]? = nil
    var errorMess : String!
    
    
    lazy var birthday = birthdayTextField.text
    lazy var userFirstName = firstNameTextField.text
    lazy var userLastName = lastNameTextField.text
    lazy var userEmail = emailTextField.text
    lazy var userPassword = passwordTextField.text
    lazy var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        birthdayTextField?.inputView = datePicker
        //DateFormatter().dateFormat = "MM/dd/yyyy"
        datePicker.addTarget(self, action: #selector(signUpViewController.changeDates(datePicker: )), for: .valueChanged)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(signUpViewController.tapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func changeDates(datePicker: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        //let birthday : String = DateFormatter().string(from: datePicker.date)
        birthdayTextField.text = formatter.string(from: datePicker.date)
        
        view.endEditing(true)
        let birthday = birthdayTextField.text
    }
    
    
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var suffixes : [String] = ["@yahoo.com","@gmail.com","@hotmail.com","@aol.com",
                            "@sbcglobal.net","@bellsouth.net","@outlook.com","@icloud.com"]
    
    
    @IBAction func signUpSubmissionButton(_ sender: UIButton) {
        success = true
        

        if(emailTextField.text == "" || firstNameTextField.text == "" || lastNameTextField.text == ""){
                errorMess = "Email or name empty"
                success = false
                self.signUpErrorLabel.text = "\(errorMess)"
                return
        }
    
        if(!(emailTextField.text?.contains("@"))!){
        /*if(!(emailTextField.text?.contains("@yahoo.com"))! ||
            !(emailTextField.text?.contains("@hotmail.com"))! ||
            !(emailTextField.text?.contains("@aol.com"))! ||
            !(emailTextField.text?.contains("@gmail.com"))! ||
            !(emailTextField.text?.contains("@icloud.com"))! ||
            !(emailTextField.text?.contains("@outlook.com"))!) {
            errorMess = "Email not formatted correctly"
            success = false
            self.signUpErrorLabel.text = "\(errorMess)"
            return
            }*/
            errorMess = "Email not formatted correctly"
            success = false
            self.signUpErrorLabel.text = "\(errorMess)"
            return
        }
       
        
        if(passwordTextField.text != confirmPasswordTextField.text){
                success = false
                errorMess = "Passwords do not match"
                self.signUpErrorLabel.text = "\(errorMess)"
                return
        }
        if((passwordTextField.text?.count)! < 8){
            success = false
            errorMess = "Password must be at least 8 characters"
            self.signUpErrorLabel.text = "\(errorMess)"
            return
            
            }else{
                success = true
                runProcesses(start: success)
                print(user)
                print(success)
        }
    }
    
    

    
    func runProcesses(start: Bool){
        if(success == true){
            self.signUpErrorLabel.text = ""
            performSegue(withIdentifier: "backToLoginScreen", sender: self)
            
            coreDataViewController.saveUserToCoreData(birthday: birthday!, firstName: userFirstName!, lastName: userLastName!, email: userEmail!, password: userPassword!)
            
            //createFirebaseUser(email: userEmail!, password: userPassword!)
            
            user = coreDataViewController.fetchUserInfo()
            
        }else{
            return
        }
    }
    
    
    func saveUserToFirebase(){
        
        
    }
    
    func createFirebaseUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error)
            }
        }
    }
    
    
    
    @IBAction func alreadyHasAccountButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if(identifier == "backToLoginScreen"){
            if(success != true){
                return false
            }else{
                return true
            }
        }
        
        return true
    }
    
}
