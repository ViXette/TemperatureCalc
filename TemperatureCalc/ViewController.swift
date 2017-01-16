//
//  ViewController.swift
//  TemperatureCalc
//
//  Created by VX on 11/01/2017.
//  Copyright © 2017 VXette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var enter_label: UILabel!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var output_label: UILabel!
	@IBOutlet weak var format_segment: UISegmentedControl!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}


	@IBAction func calculate(_ sender: UITextField) {
		guard let input = Double(textField.text!)  else {
			textField.text = ""
			return
		}
		var imageId = 1
		
		if format_segment.selectedSegmentIndex == 0 {
			let Fahrenheit = input //Double(textField.text!)
			let Celsius = (Fahrenheit - 32) / 1.8
			
			let result = String(format: "%4.1fº Celsius", Celsius)
			output_label.text = result
			
			if Celsius > 120 {
				imageId = 9
			} else if Celsius > 100 {
				imageId = 8
			} else if Celsius > 80 {
				imageId = 7
			} else if Celsius > 60 {
				imageId = 6
			} else if Celsius > 40 {
				imageId = 5
			} else if Celsius > 20 {
				imageId = 4
			} else if Celsius > 0 {
				imageId = 3
			} else if Celsius > -20 {
				imageId = 2
			} else if Celsius <= -40 {
				imageId = 1
			}
		}
		
		if format_segment.selectedSegmentIndex == 1 {
			let Celsius = input //Double(textField.text!)
			let Fahrenheit = Celsius * 1.8 + 32
			
			let result = String(format: "%4.1fº Fahrenheit", Fahrenheit)
			output_label.text = result
			
			if Fahrenheit > 160 {
				imageId = 9
			} else if Fahrenheit > 140 {
				imageId = 8
			} else if Fahrenheit > 120 {
				imageId = 7
			} else if Fahrenheit > 100 {
				imageId = 6
			} else if Fahrenheit > 80 {
				imageId = 5
			} else if Fahrenheit > 60 {
				imageId = 4
			} else if Fahrenheit > 40 {
				imageId = 3
			} else if Fahrenheit > 20 {
				imageId = 2
			} else if Fahrenheit <= 20 {
				imageId = 1
			}
		}
		
		imageView.image = UIImage(named: "Temp\(imageId).png")
		
		self.resignFirstResponder()
	}

	
	@IBAction func formatAction(_ sender: UISegmentedControl) {
		if format_segment.selectedSegmentIndex == 0 {
			enter_label.text = "Enter Fahrenheit"
			textField.text = ""
			output_label.text = "0º Celsius"
		} else if format_segment.selectedSegmentIndex == 1 {
			enter_label.text = "Enter Celsius"
			textField.text = ""
			output_label.text = "0º Fahrenheit"
		}
	}
	
}

