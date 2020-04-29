//
//  SignupViewController.swift
//  GoFood
//
//  Created by duomi on 2020/4/27.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var emailtext: UITextField!
    
    @IBOutlet weak var passwordlabel: UILabel!
    
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var retypelabel: UILabel!
    
    
    @IBOutlet weak var retypetext: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var signup: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.image = UIImage(named: "loginback")
        
        passwordtext.isSecureTextEntry = true
        
        retypetext.isSecureTextEntry = true

        emaillabel.textColor = UIColor.white
        emaillabel.font = UIFont(name: "RockSalt", size: 26)
        
        passwordlabel.textColor = UIColor.white
             
        passwordlabel.font = UIFont(name: "RockSalt", size: 26)
        
        retypelabel.textColor = UIColor.white
        retypelabel.font = UIFont(name: "RockSalt", size: 26)
        
        
        signup.setTitleColor(UIColor.white, for: .normal)
        
        signup.titleLabel!.font = UIFont(name: "RockSalt", size:35)
        
        signup.clipsToBounds = true
        signup.layer.cornerRadius = 30
        signup.layer.borderWidth = 3
        signup.layer.borderColor = UIColor.white.cgColor
        
        
        // Do any additional setup after loading the view.
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
