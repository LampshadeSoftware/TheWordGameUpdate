//
//  ViewController.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/24/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginVC: UIViewController, FBSDKLoginButtonDelegate {

    // Outlets
    @IBOutlet weak var FBLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FBLoginButton.delegate = self
        FBLoginButton.readPermissions = ["email"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged in with facebook...")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            
            print(result)
        }
    }

}

