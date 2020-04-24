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
    @IBOutlet weak var filter: UIImageView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var goFoodButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var signature: UILabel!
    @IBOutlet weak var sample1Pic: UIImageView!
    @IBOutlet weak var sample2Pic: UIImageView!
    @IBOutlet weak var sample1Name: UILabel!
    @IBOutlet weak var sample2Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //header part
        background.image = UIImage(named: "goFoodBG")
        restaurantName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantName.text = "Kiraku"
        restaurantName.font = UIFont(name: "RockSalt", size: 30)
        restaurantType.text = "Japanese Food"
        restaurantType.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantType.font = UIFont(name: "RockSalt", size: 15)
        review.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        review.font = UIFont(name: "Noteworthy-Bold", size: 18)
        
        //grey filter
        filter.clipsToBounds = true
        filter.layer.masksToBounds = false
        filter.layer.cornerRadius = filter.frame.size.width / 2
        filter.layer.backgroundColor = UIColor(red: 0.833, green: 0.831, blue: 0.837, alpha: 0.8).cgColor
        
        //core information
        info.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        info.font = UIFont(name:"Noteworthy-Bold", size: 18)
        info.text = "⏰：5:00pm - 8:00pm\n\nDistance: walk 12 min\n\nYelp rating: ⭐️⭐️⭐️⭐️"
        
        //buttons
        setButton(button: dislikeButton, title: "❌")
        setButton(button: likeButton, title: "❤️")
        setButton(button: goFoodButton, title: "GoFood")
        goFoodButton.setTitleColor(UIColor(red: 0.996, green: 0.732, blue: 0.336, alpha: 1), for: .normal)
        goFoodButton.titleLabel?.font = UIFont(name: "RockSalt", size: 20)
        
        //signature dishes
        signature.text = "Signature Dish"
        signature.font = UIFont(name: "RockSalt", size: 30)
        setImage(image: sample1Pic, name: "cornTempura", curv: CGFloat(0))
        setImage(image: sample2Pic, name: "karaage", curv: CGFloat(0))
        sample1Name.text = "Corn Tempura"
        sample1Name.font = UIFont(name: "Noteworthy-Bold", size: 15)
        sample2Name.text = "Chicken Karaage"
        sample2Name.font = UIFont(name: "Noteworthy-Bold", size: 15)
        
        // Do any additional setup after loading the view.
    }
    
    func setButton(button:UIButton, title: String) {
        button.backgroundColor = UIColor(red: 0.975, green: 0.944, blue: 0.865, alpha: 0.45)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.038, green: 0.037, blue: 0.037, alpha: 0.6).cgColor
        button.setTitle(title, for: .normal)
    }

    func setImage(image:UIImageView, name:String, curv: CGFloat) {
        image.image = UIImage(named: name)
        image.layer.cornerRadius = curv
        image.layer.masksToBounds = false
        image.clipsToBounds = true
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
