//
//  Person.swift
//  codable使用
//
//  Created by 梁森 on 2020/11/6.
//

import UIKit


struct Person: Codable {
	var name: String = ""
}


struct Obj: Codable {
	
	let menu: Menu
	
	struct Menu: Codable {
		let id: String
		let value: String
		let popup: Popup
	}
	
	struct Popup: Codable {
		let menuItem: [MenuItem]
		enum CodingKeys: String, CodingKey {
			case menuItem = "menuitem"
		}
	}
	
	struct MenuItem: Codable {
		let value: String
		let onClick: String
		enum CodingKeys: String, CodingKey {
			case value
			case onClick = "onclick"
		}
	}
	
}
