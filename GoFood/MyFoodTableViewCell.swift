//
//  MyFoodTableViewCell.swift
//  GoFood
//
//  Created by duomi on 2020/4/21.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class MyFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var resfood: UIImageView!
    
    @IBOutlet weak var resname: UILabel!
    
    @IBOutlet weak var restype: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let bg = UIView()
        bg.backgroundColor = UIColor.clear
        self.selectedBackgroundView = bg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
