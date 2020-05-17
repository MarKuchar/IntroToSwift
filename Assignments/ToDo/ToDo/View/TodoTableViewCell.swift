//
//  TodoTableViewCell.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet var taskLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = UITableViewCell.AccessoryType.detailDisclosureButton
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
