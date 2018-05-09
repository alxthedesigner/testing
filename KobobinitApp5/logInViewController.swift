//
//  logInViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/22/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import SwiftyJSON


class logInViewController: UIViewController{

    
    //HOSTING URL https://food-app-404dc.firebaseapp.com
    //MARK: LOG IN/SIGN UP PROPERTIES

    @IBOutlet var logInEmail: UITextField!
    @IBOutlet var logInPassword: UITextField!
    @IBOutlet weak var userFullName: UILabel?
    @IBOutlet weak var userEmail: UILabel?
    @IBOutlet weak var userBirthday: UILabel?
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    
    var jsonID : String?
    var jsonFirstName : String?
    var jsonLastName : String?
    var jsonEmail : String?
    var jsonBirthday : String?

    
    
    var facebookSignInButton : UIButton!
    @IBOutlet weak var errorLabel2: UILabel!
    var success : Bool = false;
    var user:[Users]? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom FB Login Button
        let facebookSignInButton = UIButton(frame: CGRect(x: self.view.center.x, y: (self.view.center.y), width: 365, height: 45))
        facebookSignInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        facebookSignInButton.setTitle("Login via Facebook", for: .normal)
        facebookSignInButton.setTitleColor(.white, for: .normal)
        facebookSignInButton.backgroundColor = UIColor(red: 59.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1.0)
        facebookSignInButton.center = view.center
        facebookSignInButton.layer.cornerRadius = 3
        facebookSignInButton.addTarget(self, action: #selector(facebookLoginButtonAction), for: .touchUpInside)
        
        accountInfoViewController().retrieveFacebookProfileData()
        
        self.view.addSubview(facebookSignInButton)
        
    }
 
    
    //MARK: Log in using Facebook
    /**************************************************************************************
    *    Title: Sign In with Facebook: Firebase Authentication in Swift 4 (2018)
    *    Author: Alex Nagy (Rebeloper - Rebel Developer)
    *    Date: Feb 19, 2018
    *    Code version: 4.0
    *    Availability: https://www.youtube.com/watch?v=D4Ex2QgBy4A
    *
    ***************************************************************************************/
    
    @objc func facebookLoginButtonAction(){
        
        let manager = LoginManager()
        manager.logIn(readPermissions: [ .publicProfile, .email, .userFriends, .userBirthday, .userPhotos], viewController: self) { (result) in
            switch result{
            case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                self.success = true
                self.authFacebookWithFirebase()
                accountInfoViewController().retrieveFacebookProfileData()
                super.performSegue(withIdentifier: "logInToHome", sender: self)
                
                
            case .cancelled:
                print("Log in cancelled!")
             
            case .failed:
                print("Failed to log in!")
                self.success = false
                
            }
        }
    }


    
    func authFacebookWithFirebase(){
        guard let authToken = AccessToken.current?.authenticationToken else {return}
        let creditials = FacebookAuthProvider.credential(withAccessToken: authToken)
        
       
        Auth.auth().signIn(with: creditials) {(user, error) in
            if let error = error {
                print(error)
                return
            }
        print("Successfully authenticated Facebook Profile using Firebase")
        }
       
        
    }
    
    func authLocalUserWithFirebase(){
    
    Auth.auth().signIn(withEmail: logInEmail.text!, password: logInPassword.text!) { (user, error) in
    if let error = error {
    print(error)
    return
    }
    print("Successfully authenticated user using Firebase")
    }
    }
    
    //MARK: Log in locally
    @IBAction func logInButton(_ sender: UIButton) {
        
      user = coreDataViewController.fetchUserInfo()
        
        for i in user!{
            if(logInEmail.text == i.email && logInPassword.text == i.password){
                success = true
                authLocalUserWithFirebase()
                performSegue(withIdentifier: "logInToHome", sender: self)
                self.errorLabel2.text = ""
                
                
            }else{
                //print("Invalid Credintials")
                self.errorLabel2.text = "Invalid Login Info"
                success = false
            }
        
        }
    
    }
    
    
    func saveUserToFirebase(){
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
        if(identifier == "logInToHome"){
            if(success != true){
                return false
            }else{
                return true
            }
        }
        
    return true
    }
}

    

    

