//
//  DetailTableViewCell.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-15.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    private let textField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    convenience init(placeholder: String) {
        self.init()
        contentView.addSubview(textField)
        textField.matchParent()
        textField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

}
