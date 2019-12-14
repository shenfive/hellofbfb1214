//
//  ViewController.swift
//  hellofbfb1214
//
//  Created by 申潤五 on 2019/12/14.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController,LoginButtonDelegate {

    

    @IBOutlet weak var fbLoginButton: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fbLoginButton.delegate = self
        
    }

    @IBAction func checkLogin(_ sender: Any) {
        if let token = AccessToken.current {
            print(token)
            
        }
    }
    
    
    //MARK:FBLoginDelegate
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error  {
            showAlert("error:\(error.localizedDescription)")
            return
        }
        
        if let accessToken = AccessToken.current{
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            Auth.auth().signIn(with: credential) { (result, error) in
                if let error = error{
                    self.showAlert("error:\(error.localizedDescription)")
                    return
                }
            }
        }
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout 成功了")
    }
}


extension UIViewController{
    func showAlert(_ msg:String){
        let alert = UIAlertController(title: "注意", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
