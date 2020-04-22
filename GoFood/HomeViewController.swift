//
//  HomeViewController.swift
//  GoFood
//
//  Created by duomi on 2020/4/21.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var myfood: UILabel!
    @IBOutlet weak var tabBar: UITabBarItem!
    
    @IBOutlet weak var homebackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homebackground.image = UIImage(named: "homeback")
        myfood.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        myfood.font = UIFont(name: "RockSalt", size: 55)

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
