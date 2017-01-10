//
//  ViewController.swift
//  TargetSetting
//
//  Created by Drew Westcott on 10/01/2017.
//  Copyright © 2017 Drew Westcott. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet weak var targetField: UITextField!

	let localStorage = UserDefaults.standard
	var target = 10000
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		targetField.delegate = self
		
		if let storedTarget = localStorage.object(forKey: "target") as? Int {
			targetField.placeholder = "\(storedTarget)"
			target = storedTarget
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.resignFirstResponder()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
		super.touchesBegan(touches, with: event)
	}
	
	@IBAction func setTargetTapped(_ sender: Any) {
		if targetField.text != "" && targetField.text != nil {
			targetField.resignFirstResponder()
			target = Int(targetField.text!)!
			localStorage.set(target, forKey: "target")
		} else {
			// display a warning?
		}
	}
	
}

