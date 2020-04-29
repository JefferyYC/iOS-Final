//
//  SurveyTableViewCell.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/20/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class SurveyTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var onePressed: Bool = false
    var twoPressed: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // change the color when cell is selected to clear
        let bg = UIView()
        bg.backgroundColor = UIColor.clear
        self.selectedBackgroundView = bg
        // change survey text
        question.textColor = UIColor(red: 0.046, green: 0.023, blue: 0.001, alpha: 1)
        question.font = UIFont(name: "Noteworthy-Bold", size: 18)
        optionOne.layer.cornerRadius = 20
        optionOne.layer.borderWidth = 3
        optionOne.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        optionOne.titleLabel!.font = UIFont(name: "Noteworthy-Bold", size: 18)
        optionTwo.layer.cornerRadius = 20
        optionTwo.layer.borderWidth = 3
        optionTwo.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        optionTwo.titleLabel!.font = UIFont(name: "Noteworthy-Bold", size: 18)
        optionOne.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
        optionTwo.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
    }
    
    
    
    @IBAction func pressOne(_ sender: UIButton) {
        if !onePressed{
            self.optionTwo.backgroundColor = UIColor.clear
            self.optionTwo.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
            sender.backgroundColor = UIColor.darkGray
            sender.setTitleColor(UIColor.white, for: .normal)
            onePressed = true
            twoPressed = false
        }
    }
    
    @IBAction func pressTwo(_ sender: UIButton) {
        if !twoPressed{
            self.optionOne.backgroundColor = UIColor.clear
            self.optionOne.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
            sender.backgroundColor = UIColor.darkGray
            sender.setTitleColor(UIColor.white, for: .normal)
            onePressed = false
            twoPressed = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
