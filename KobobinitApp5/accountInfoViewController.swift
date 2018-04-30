//
//  accountInfoViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 4/17/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit
import FacebookCore
import SwiftyJSON


class accountInfoViewController: UIViewController {
    
    @IBOutlet weak var userFullName: UILabel?
    @IBOutlet weak var userEmail: UILabel?
    @IBOutlet weak var userBirthday: UILabel?
    @IBOutlet weak var facebookProfilePic: UIImageView?
    
    
    var jsonID : String?
    var jsonFirstName : String?
    var jsonLastName : String?
    var jsonEmail : String?
    var jsonBirthday : String?

    var profilePicture : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        retrieveFacebookProfileData()
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveFacebookProfileData(){
    
        let profilePicURL = "https:graph.facebook.com/\(self.jsonID)/picure?type=large"
        let graphPath = "/me"
        let accToken = AccessToken.current
        let parameters: [String : String]? = ["fields": "id, first_name,last_name,email,birthday,picture.type(large)"]
        let httpMethod: GraphRequestHTTPMethod = .GET
        let apiVersion: GraphAPIVersion = .defaultVersion
        let graphConnection = GraphRequestConnection()
      
        let request = GraphRequest(graphPath: graphPath, parameters: parameters!, accessToken: accToken , httpMethod: httpMethod, apiVersion: apiVersion)
        
        graphConnection.add(request) { response, result in
            switch result {
            case .success(let response):
                print("Graph Request Connection Established")
             
                
                guard let responseDictionary = response.dictionaryValue else {return}
                print(response)                     //All JSON type fields from response
                print(response.dictionaryValue)
               
                let jsonTypeResponse = JSON(responseDictionary)
                self.jsonID = jsonTypeResponse["id"].string
                self.jsonFirstName = jsonTypeResponse["first_name"].string
                self.jsonLastName = jsonTypeResponse["last_name"].string
                self.jsonEmail = jsonTypeResponse["email"].string
                self.jsonBirthday = jsonTypeResponse["birthday"].string
               
                
                //guard let profilePicURL = jsonTypeResponse["profile"]["data"]["url"].string else {return}
                
                //guard let url = URL(string: profilePicURL) else {return}
            
                guard let url = URL(string: profilePicURL) else {return}
                
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in if let error = error{
                        print(error)
                    }
                    guard let data = data else {return}
                    print(data)
                    DispatchQueue.main.async {
                        self.profilePicture = UIImage(data: data)
                        self.facebookProfilePic?.image = self.profilePicture
                    }
                }).resume()
                
                
                if(self.jsonID != nil){
                    print("JSON values are not nil")
                    print("\(self.jsonFirstName)")
                    self.changeNames()

                }else{
                    print("JSON FACEBOOK ID EMPTY!!!!")
                }
                
     
            case .failed(let error):
                print("Custom Graph Request Failed: \(error)")
                
            }
        }
        graphConnection.start()
    }
    
    
    func changeNames(){
        userFullName?.text = "\(jsonFirstName!)" + " " + "\(jsonLastName!)"
        userEmail?.text = jsonEmail
        userBirthday?.text = jsonBirthday
        //facebookProfilePic?.image = profilePicture
    }
    
}


