//
//  menuItemsTableViewCell.swift
//  KobobinitApp5
//
//  Created by Alex Stanford on 3/28/18.
//  Copyright © 2018 Alex Stanford. All rights reserved.
//

import UIKit

class menuItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
