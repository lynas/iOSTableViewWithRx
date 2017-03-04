//
//  TableViewCell.swift
//  TableRx
//
//  Created by Md Sazzad Islam on 2/11/17.
//  Copyright © 2017 lynas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var label1: UILabel!
	@IBOutlet weak var label2: UILabel!
	
	var person: Person! {
		didSet {
			updateUI()
		}
	}
	
	private func updateUI(){
		self.label1.text = person.name
		self.label2.text = "\(person.age)"
	}
	
	
	

}
