//
//  adminPortalViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/28/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit

class adminPortalViewController: UIViewController {

    @IBOutlet weak var onTheClockUserTextField: UITextField!
    @IBOutlet weak var onTheClockPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let empPortalUserName = "admin"
    let empPortalPassword = "password"
  
    var success : Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func empLoginBackButton(_ sender: UIBarButtonItem) {
        goBack()
    }
    
    @IBAction func activeOrdersBackButton(_ sender: UIBarButtonItem) {
        goBack()
    }
    
    
    @IBAction func empLoginEnterButton(_ sender: UIButton) {
        if(onTheClockUserTextField.text == empPortalUserName && onTheClockPasswordTextField.text == empPortalPassword){
            success = true
            //performSegue(withIdentifier: "enterActiveOrdersSegue", sender: self)
            
        }else{
            success = false
            errorLabel.text = "Invalid Credintials"
            print("Invalid ")
        }
      
    }
    
    func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func adminBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if(identifier == "enterActiveOrdersSegue"){
            if(success != true){
                return false
            }else{
                return true
            }
        }
        
        return true
    }

}
