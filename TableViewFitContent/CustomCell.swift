//
//  CustomCell.swift
//  TableViewFitContent
//
//  Created by Jay Liew on 7/3/17.
//  Copyright © 2017 Jay Liew. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
