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
        updateCounter()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("updateCounter"), name:"count", object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }


}

