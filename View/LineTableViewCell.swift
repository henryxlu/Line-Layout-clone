//
//  LineTableViewCell.swift
//  Line Profile
//
//  Created by Henry on 2019/6/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit



class LineTableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
