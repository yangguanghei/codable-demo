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
		
		let p: NSDictionary = ["menu": ["id": "nil", "value": "File", "popup": ["menuitem": [
		
			["value": "nil", "onclick": "C"],
			["value": "Open", "onclick": "O"],
			["value": "Close", "onclick": "P"]
		
		]]]]
		
		let d = convertDictionaryToJSONString(dict: p)
		
		let data = d.data(using: .utf8)!
		do {
			let obj = try JSONDecoder().decode(Obj.self, from: data)
			
//			let name = obj.name
			
			let value = obj.menu.popup.menuItem[1].value
			print("😊😊😊😊😊")
			print(value)
			
			let id = obj.menu.id
			print(id)
			
		} catch {
			print("出错了\(error)")
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
