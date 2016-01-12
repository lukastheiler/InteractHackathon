//
//  ViewController.swift
//  Hackathon
//
//  Created by Lukas Theiler on 12.01.16.
//  Copyright © 2016 Lukas Theiler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count=0;
    
    @IBOutlet weak var counterLabel: UILabel!
    
    func updateCounter(){
        count=count+1
        counterLabel.text="#\(count) mal gedrückt!"
    }
    
    @IBAction func countButtonPressed(sender: AnyObject) {
        count=count+1
        counterLabel.text="#\(count) mal gedrückt!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

