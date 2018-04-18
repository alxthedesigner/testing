//
//  coreDataViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/31/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit
import CoreData

class coreDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    class func objectContext() -> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    
    
    //Save User
    class func saveUserInfo(firstName: String, lastName: String, email: String, password: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        

            user.setValue(firstName, forKey: "firstName")
            user.setValue(lastName, forKey: "lastName")
            user.setValue(email, forKey: "email")
            user.setValue(password, forKey: "password")
        
        
        do{
            try context.save()
            print("USER SAVED SUCCESSFULLY")
        }
        catch{
            print("USER NOT SAVED")
        }
        
    }
    
    
    //Fetch User
    class func fetchUserInfo() -> [Users]?{
        
        let context = objectContext()
            
        var user:[Users]? = nil
            
        do  {
                user = try context.fetch(Users.fetchRequest())
            }
        catch
            {
                print("Did not retrieve user")
                return user
            }
            print("User retrieved!")
            return user
        }
    
}

