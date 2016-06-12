//
//  DetailViewController.swift
//  Animal
//
//  Created by Chris Price on 22/06/2015.
//  Copyright (c) 2015 Chris Price. All rights reserved.
//

import UIKit

import UIKit

class DetailViewController: UIViewController {
    
    var valueForLabel = ""
    
    @IBOutlet weak var favourite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        favourite!.text = valueForLabel;
    }
    
    
    
}

