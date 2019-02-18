//
//  ViewController.swift
//  MyFirst
//
//  Created by Tomoya Mato on 2019/02/18.
//  Copyright © 2019 t2kmato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        outputLabel.text = "Hello Swift!"
    }

    @IBOutlet weak var outputLabel: UILabel!
    
}

