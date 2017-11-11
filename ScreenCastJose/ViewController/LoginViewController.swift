//
//  LoginViewController.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/9/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    // MARK: Properties. ------------------------------------------------------------------------
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
   

    // MARK: Life cycle. ------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setupsignals()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions ------------------------------------------------------------------------
    @IBAction func loginButtonPressed(_ sender: Any)
    {
        if areValidCredentials()
        {
            loginViewModel.login(username: usernameTextfield.text!, password: passwordTextfield.text!)
        }
    }
    
    // MARK: Class methods ------------------------------------------------------------------------
    
    
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
    
    /*
    *   This function sets up the signal listening when login returns a positive code and sets the user session.
    **/
    func setupsignals()
    {
        // Subscribe to the signals.
        loginViewModel.updatedContentSignal.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] (_) in
            //  Received signal.
            if let strongSelf = self
            {
                //  Checks 0 code, which means login success. It can return 401 (Invalid password.)
                if self?.loginViewModel.getCode() == 0
                {
                    strongSelf.performSegue(withIdentifier: "ShowEpisodeListSegue", sender: nil)
                }
            }
        }).disposed(by: disposeBag)
       
 
    
    }
}
