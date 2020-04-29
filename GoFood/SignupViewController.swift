//
//  SignupViewController.swift
//  GoFood
//
//  Created by duomi on 2020/4/27.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var emailtext: UITextField!
    
    @IBOutlet weak var passwordlabel: UILabel!
    
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var retypelabel: UILabel!
    
    
    @IBOutlet weak var retypetext: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.image = UIImage(named: "loginback")
        
//        passwordtext.isSecureTextEntry = true
//        passwordtext.autocorrectionType = .no
//
//        retypetext.isSecureTextEntry = true
//        retypetext.autocorrectionType = .no

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
        error.alpha = 0
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func validation() -> String? {
        if emailtext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordtext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || retypetext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "please fill all fields."
        }
        if passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines).count < 7 {
            return "password too short"
        }
        if passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines) != retypetext.text!.trimmingCharacters(in: .whitespacesAndNewlines) {
            return "must macth password."
        }
        
        return nil
    }
    
    
    @IBAction func signuppressed(_ sender: Any) {
        let err = validation()
        
        if err != nil {
            error.text = err!
            error.textColor = UIColor.red
            error.alpha = 1
        } else {
            let email = emailtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (res, wrong) in
                if wrong != nil {
                    self.error.text = "Error creating user, maybe invalid email"
                    self.error.textColor = UIColor.red
                    self.error.alpha = 1
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email": email, "password": password, "uid": res!.user.uid])
//                    self.performSegue(withIdentifier: "goback", sender: nil)
                }
                
                
            }
        }
        
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
