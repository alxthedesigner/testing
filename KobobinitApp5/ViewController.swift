//
//  ViewController.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/22/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//
//HOME SCREEN CONTROL
import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    struct menuItem {
        var name = ""
        var description = ""
        var price = 0.00
        
    }
    
    @IBOutlet weak var numOfItemsInOrder: UILabel!
    @IBOutlet weak var numOfItemsInOrder2: UILabel!
    @IBOutlet weak var totalPricerLabelTop: UILabel!
    @IBOutlet weak var totalPricerLabelBottom: UILabel!
    @IBOutlet weak var orderTableView: UITableView!
    
    
    
    var itemsInOrder: [menuItem] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        orderTableView?.delegate = self
        orderTableView?.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: Order Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return itemsInOrder.count
    }
    
    
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        
            
            let itemTitle1 = itemsInOrder[indexPath.row]
            
            let cell2 = orderTableView.dequeueReusableCell(withIdentifier: "orderCell") as! finalTableViewCell
            cell2.itemName.text = itemTitle1.name
            
            return cell2

        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Swipe-to-Delete
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.decrementItem(item: self.itemsInOrder[indexPath.row])
            self.itemsInOrder.remove(at: indexPath.row)
            self.orderTableView.deleteRows(at: [indexPath], with: .top)
            
          
            self.counter -= 1
            print(self.itemsInOrder)
          
        }
        return [delete]
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: ITEM BUTTONS
    //Recipes
    @IBAction func chickenKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Chicken Kobob", description: "Chicken + Veggies" , price: 7.00))
    }
    
    
    @IBAction func steakKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Steak Kobob", description: "Steak + Veggies", price: 7.00))
    }
    
    
    @IBAction func sausageKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Sausage Kobob", description: "Sausage + Veggies", price: 7.00))
    }
    

    @IBAction func countryStyleRibs(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Country Style Ribs", description: "Ribs + Veggies", price: 7.00))
    }
    
    
    @IBAction func baconWrappedKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Bacon Wrapped Kobob", description: "Any Kobob Wrapped in bacon", price: 7.00))
    }
    

    @IBAction func veggieKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Veggie Kobob", description: "Zucchini + Bell Pepper + Onions + Mushroom + Squash", price: 7.00))
    }
    
    
    //Specialties

    @IBAction func bamaKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Bama Kobob", description: "Hotlink + Chicken (or Steak)" , price: 9.00))
    }
    

    @IBAction func OGTrio(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "OG Trio", description: "Chicken + Steak + Sausage" , price: 9.00))
    }
    
    
    @IBAction func jamminJerkKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Jammin' Jerk Kobob", description: "Chicken or Steak" , price: 9.00))
    }
    

    @IBAction func fajitaKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Fajita Kobob", description: "Chicken or Steak w/ tortilla shells" , price: 9.00))
    }
    
    

    @IBAction func slapYaMamaKobob(_ sender: UIButton) {
        addRecipeToOrder(item: menuItem(name: "Slap Ya' Mama Kobob", description: "Chicken + Steak + Ribs + Pineapple" , price: 9.00))
    }
    
  
    //MARK: FUNCTIONS
    var tax = 0.06
    var total: Double = 0.00{
        didSet{
            totalPricerLabelTop.text = "\(total)"
            totalPricerLabelBottom.text = totalPricerLabelTop.text
        }
    }
    var counter: Int = 0{
        didSet{
            numOfItemsInOrder.text = "\(counter)"
            numOfItemsInOrder2.text = numOfItemsInOrder.text
        }
    }
    
    func insertNewItem(item: menuItem){
        itemsInOrder.append(item)
        
        let indexPath = IndexPath(row: itemsInOrder.count - 1, section: 0)
        
        orderTableView.beginUpdates()
        orderTableView.insertRows(at: [indexPath], with: .automatic)
        orderTableView.endUpdates()
        
    }

    func addRecipeToOrder(item: menuItem){

        total += item.price //+ (price * tax)
        counter += 1
        
        insertNewItem(item: item)
    }
    
    
    func decrementItem(item: menuItem){

        total -= item.price

    }

    

}
