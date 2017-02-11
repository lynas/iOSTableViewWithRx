//
//  ViewController.swift
//  TableRx
//
//  Created by Md Sazzad Islam on 2/11/17.
//  Copyright © 2017 lynas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Person {
	let name : String
	let age : Int
	
}
class ViewController: UIViewController {
	
	let personArray = [
		
		Person(name: "name1", age: 11),
		Person(name: "name2", age: 12),
		Person(name: "name3", age: 13),
		Person(name: "name4", age: 14),
		Person(name: "name5", age: 15),
		Person(name: "name6", age: 16),
		Person(name: "name7", age: 17),
		Person(name: "name8", age: 18),
		Person(name: "name9", age: 19),
		Person(name: "name10", age: 20),
		Person(name: "name11", age: 21),
		Person(name: "name12", age: 22),
		Person(name: "name13", age: 22),
		Person(name: "name14", age: 23),
		Person(name: "name15", age: 24),
		Person(name: "name16", age: 25),
		Person(name: "name17", age: 26),
		Person(name: "name18", age: 27)
		
	]
	
	let disposeBag = DisposeBag()

	@IBOutlet weak var mytable: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let objArray : Observable<[Person]> = Observable.just(personArray)

		objArray.bindTo(mytable.rx.items(cellIdentifier: "cell")) {
			_ , person, cell in
			if let cellToUse = cell as? TableViewCell {
				cellToUse.label1.text = person.name
				cellToUse.label2.text = "\(person.age)"
			}
		}.addDisposableTo(disposeBag)
		
		
		mytable.rx.modelSelected(Person.self).subscribe(onNext: {
				person in
			print(person.name)
		}).addDisposableTo(disposeBag)
		
		
		mytable.rx.itemSelected.subscribe(onNext : {
			[weak self] indexPath in
			if let cell = self?.mytable.cellForRow(at: indexPath) as? TableViewCell {
				cell.label1.text = "new value"
				
				
			}
		}).addDisposableTo(disposeBag)
		
	}



}

