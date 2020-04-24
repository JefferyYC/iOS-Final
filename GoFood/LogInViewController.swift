//
//  LogInViewController.swift
//  GoFood
//
//  Created by duomi on 2020/4/21.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var goFood: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var background: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.image = UIImage(named: "loginback")
        goFood.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        goFood.font = UIFont(name: "RockSalt", size: 72)
        
        username.placeholder = "Username:"
        
        password.placeholder = "Password:"
        password.isSecureTextEntry = true
        
        
        signup.setTitle("SignUp!", for: .normal)
        signup.setTitleColor(UIColor.white, for: .normal)
        signup.titleLabel!.font = UIFont(name: "RockSalt", size: 22)
        signup.clipsToBounds = true
        signup.layer.cornerRadius = 30
        signup.layer.borderWidth = 3
        signup.layer.borderColor = UIColor.white.cgColor
        
        
        login.setTitle("LogIn!", for: .normal)
        login.setTitleColor(UIColor.white, for: .normal)
        login.titleLabel!.font = UIFont(name: "RockSalt", size: 22)
        login.clipsToBounds = true
        login.layer.cornerRadius = 30
        login.layer.borderWidth = 3
        login.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    //hide the nav bar on login page
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
