//
//  menuViewController.swift
//  
//
//  Created by Alex Stanford on 3/28/18.
//

import UIKit

class menuViewController: UIViewController {
    struct menuItem {
        var name = ""
        var description = ""
        var price = 0.00
        
    }
    
    var menu: [menuItem] = [
        //Recipes
        menuItem(name: "Chicken Kobob", description: "Chicken + Veggies" , price: 7.00),
        menuItem(name: "Steak Kobob", description: "Steak + Veggies", price: 7.00),
        menuItem(name: "Sausage Kobob", description: "Sausage + Veggies", price: 7.00),
        menuItem(name: "Country Style Ribs", description: "Ribs + Veggies", price: 7.00),
        menuItem(name: "Bacon Wrapped Kobob", description: "Any Kobob Wrapped in bacon", price: 7.00),
        menuItem(name: "Veggie Kobob", description: "Zucchini + Bell Pepper + Onions + Mushroom + Squash", price: 7.00),
        
        
        //Specialties
        menuItem(name: "Bama Kobob", description: "Hotlink + Chicken (or Steak)" , price: 9.00),
        menuItem(name: "OG Trio", description: "Chicken + Steak + Sausage" , price: 9.00),
        menuItem(name: "Jammin' Jerk Kobob", description: "Chicken or Steak" , price: 9.00),
        menuItem(name: "Fajita Kobob", description: "Chicken or Steak w/ tortilla shells" , price: 9.00),
        menuItem(name: "Slap Ya' Mama Kobob", description: "Chicken + Steak + Ribs + Pineapple" , price: 9.00)
    
    
        //Sides go here
        
    ]


    
    
    //Specialties
    var bamaKobob = menuItem(name: "Bama Kobob", description: "Hotlink + Chicken (or Steak)" , price: 9.00)
    var ogTrio = menuItem(name: "OG Trio", description: "Chicken + Steak + Sausage" , price: 9.00)
    var jamminJerkKobob = menuItem(name: "Jammin' Jerk Kobob", description: "Chicken or Steak" , price: 9.00)
    var fajitaKobob = menuItem(name: "Fajita Kobob", description: "Chicken or Steak w/ tortilla shells" , price: 9.00)
    var slapYaMamaKobob = menuItem(name: "Slap Ya' Mama Kobob", description: "Chicken + Steak + Ribs + Pineapple" , price: 9.00)
    
    
    //Sides
        //Code
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
