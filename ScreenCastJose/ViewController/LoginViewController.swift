//
//  LoginViewController.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/9/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties.
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if areValidCredentials() {
            performSegue(withIdentifier: "ShowEpisodeListSegue", sender: nil)
        }
    }
    
    // MARK: Class methods
    func areValidCredentials() -> Bool {
        let isValid = true
        guard let usernameText = usernameTextfield.text, !usernameText.isEmpty else {
            return false
        }
        guard let passwordText = passwordTextfield.text, !passwordText.isEmpty else {
            return false
        }
        return isValid
    }
}
