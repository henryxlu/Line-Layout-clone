//
//  SecondTableViewCell.swift
//  Line Profile
//
//  Created by Henry on 2019/6/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var titalLabel: UILabel!
    @IBOutlet weak var containLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//    func dataUpdate(_ data: Data){
//        stateLabel.text = data.contain
//        mainLabel.text = data.title
//    }
}
