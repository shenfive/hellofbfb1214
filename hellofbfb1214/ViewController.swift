//
//  ViewController.swift
//  hellofbfb1214
//
//  Created by 申潤五 on 2019/12/14.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var fbLoginButton: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    

        
    }

    @IBAction func checkLogin(_ sender: Any) {
        if let token = AccessToken.current {
            print(token)
            
        }
    }
    
}

