//
//  ViewController.swift
//  codable使用
//
//  Created by 梁森 on 2020/11/6.
//

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		view.backgroundColor = .green
		
		let parameter: NSDictionary = ["name": "爸爸"]
//		let d = convertDictionaryToJSONString(dict: parameter)
		
		let p: NSDictionary = ["menu": ["id": "d", "value": "File", "popup": ["menuitem": [
			["value": "1", "onclick": "C"],
			["value": "2", "onclick": "P"],
			["value": "3", "onclick": "J", "some": "s"]
		
		]]]]
		
		let d = convertDictionaryToJSONString(dict: p)
		
		let data = d.data(using: .utf8)!
		do {
			let obj = try JSONDecoder().decode(Obj.self, from: data)
			let value = obj.menu.popup.menuItem[1].value
			print(value)
			let id = obj.menu.id
			print(id)
		} catch {
			print("出错了\(error)")
		}
		
	}
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
		let onClick: String?	// 如果不是可选类型且后台没有返回，decode不成功
		enum CodingKeys: String, CodingKey {
			case value
			case onClick = "onclick"
		}
	}
}

extension ViewController {
	
	func convertDictionaryToJSONString(dict:NSDictionary?)->String {
		let data = try? JSONSerialization.data(withJSONObject: dict!, options: JSONSerialization.WritingOptions.init(rawValue: 0))
		let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
		return jsonStr! as String
	}
}
