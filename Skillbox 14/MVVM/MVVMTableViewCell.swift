//
//  MVVMTableViewCell.swift
//  Skillbox 14
//
//  Created by Артём on 10/31/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class MVVMTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
