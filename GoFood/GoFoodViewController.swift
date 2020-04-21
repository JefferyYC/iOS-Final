//
//  GoFoodViewController.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/20/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class GoFoodViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var review: UILabel!
    @IBOutlet weak var restaurantPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //header part
        background.image = UIImage(named: "goFoodBG")
        restaurantName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantName.font = UIFont(name: "RockSalt", size: 35)
        restaurantType.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantType.font = UIFont(name: "RockSalt", size: 20)
        review.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        review.font = UIFont(name: "Noteworthy-Bold", size: 18)
        restaurantPic.image = UIImage(named: "kiraku")
        restaurantPic.layer.cornerRadius = restaurantPic.frame.size.width / 2
        restaurantPic.layer.masksToBounds = false
        restaurantPic.clipsToBounds = true
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
