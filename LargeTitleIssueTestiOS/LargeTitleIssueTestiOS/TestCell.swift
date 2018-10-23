//
//  TestCellTableViewCell.swift
//  New myTC
//
//  Created by Sam Rowley on 18/10/2018.
//  Copyright © 2018 Travel Counsellors. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
