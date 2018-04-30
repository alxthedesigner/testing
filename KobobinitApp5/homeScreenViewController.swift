/**************************************************************************************
 *    Title: iOS Quickstart
 *    Author: Google Docs
 *    Date: March 15, 2018
 *    Code version: N/A
 *    Availability: https://developers.google.com/calendar/quickstart/ios?ver=swift
 *    A simple iOS application that makes requests to the Google Calendar API.
 ***************************************************************************************/

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

class homeScreenViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

    @IBAction func signOutButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

/*Portions of this page are reproduced from work created and shared by Google and
used according to terms described in the Creative Commons 3.0 Attribution License.
https://developers.google.com/calendar/quickstart/ios?ver=swift */
