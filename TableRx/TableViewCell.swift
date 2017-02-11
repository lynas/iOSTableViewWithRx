//
//  TableViewCell.swift
//  TableRx
//
//  Created by Md Sazzad Islam on 2/11/17.
//  Copyright © 2017 lynas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var label2: UILabel!
	@IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
