//
//  dataController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/22/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit
import CoreData

class dataController: NSObject {
    
    //MARK: CONTEXT
    private class func createContext() -> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    
    //MARK: SAVE USER
    class func savedUser(firstName: String, lastName: String, email: String, password: String) -> Bool{
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: createContext())
        let object = NSManagedObject(entity: entity!, insertInto: createContext())
        
        object.setValue(firstName, forKey: "firstName")
        object.setValue(lastName, forKey: "lastName")
        object.setValue(email, forKey: "email")
        object.setValue(password, forKey: "password")
        
        do{
            try createContext().save()
            return true
        }catch{
            return false
        }
    }
    
    //MARK: FETCH USER
    class func findObject() -> [Users]?{
        
        var user:[Users]? = nil
        
        do{
            user = try createContext().fetch(Users.fetchRequest())
        }catch{
            return user
        }
        return user
    }
    
    
    
    //MARK: LOG IN DATA MATCH
    class func logIn(email: String, password: String) -> Bool{
        
        let context = createContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
    
        do{
            let result = try context.fetch(request)
            for i in result as! [NSManagedObject]{
                let fetchedEmail = (i.value(forKey: "email") as? String)
                let fetchedPassword = (i.value(forKey: "password") as? String)
                
                if (email == fetchedEmail && password == fetchedPassword){
                    print("Please Enter..")
                    
                    return true
                }
            }
        }catch{
            print("No Matching Email or Password")
            return false
        }
        print("false returned")
        return false
    }

}



//Create Data Stack





