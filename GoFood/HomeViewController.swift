//
//  HomeViewController.swift
//  GoFood
//
//  Created by duomi on 2020/4/21.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var myfood: UILabel!
    
    @IBOutlet weak var tabBar: UITabBarItem!
    
    @IBOutlet weak var foodlist: UITableView!
    
    @IBOutlet weak var homebackground: UIImageView!
    
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodlist.dataSource = self
        foodlist.delegate = self
        homebackground.image = UIImage(named: "homeback")
        myfood.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        myfood.font = UIFont(name: "RockSalt", size: 56)

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell") as? MyFoodTableViewCell{
            cell.resname.text = "Kiraku"
            cell.resname.font = UIFont(name: "RockSalt", size:20)
            cell.restype.text = "Japanese Food"
            cell.restype.font = UIFont(name: "RockSalt", size:12)
            cell.resfood.image = UIImage(named: "kiraku")
            return cell
        } else {
            return UITableViewCell()
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
