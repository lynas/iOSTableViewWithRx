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
		Person(name: "name3", age: 13)
	]

	let disposeBag = DisposeBag()
	var items : Observable<[Person]>!

	@IBAction func bb(_ sender: UIButton) {
		let newPersonArray = [
			Person(name: "name -3", age: 11),
			Person(name: "name -4", age: 12)
		]
		prependData(dataToPrepend: newPersonArray)
	}
	
	
	
	@IBAction func appendData(_ sender: UIButton) {
		let newPersonArray = [
			Person(name: "name 6", age: 11),
			Person(name: "name 7", age: 12)
		]
		appendData(dataToAppend : newPersonArray)
	}
	
	
	@IBOutlet weak var mytable: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		items = Observable.just(personArray)
		bindData()
	}
	
	private func bindData() {
		mytable.dataSource = nil
		items.bindTo(mytable.rx.items(cellIdentifier: "cell")) { (row, person, cell) in
			if let cellToUse = cell as? TableViewCell {
				cellToUse.label1.text = person.name
				cellToUse.label2.text = "\(person.age)"
			}
		}.addDisposableTo(disposeBag)
	}
	
	private func prependData(dataToPrepend : [Person]) {
		let newObserver = Observable.just(dataToPrepend)
		items = Observable.combineLatest(items, newObserver) {
			$1+$0
		}
		bindData()
	}
	
	private func appendData(dataToAppend : [Person]) {
		let newObserver = Observable.just(dataToAppend)
		items = Observable.combineLatest(items, newObserver) {
			$0+$1
		}
		bindData()
	}
}














