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
    
       
    
    //struct foods {
    //          var image: String
    //          var name: String
    //          var type: String
    //      }
          
    //let f1 = foods(image: "duck", name: "DaDong", type: "Chinese Food")
    //let f2 = foods(image: "brunch", name: "Morning Cafe", type: "Brunch")
    //let f3 = foods(image: "kiraku", name: "Kiraku", type: "Japanese Food")
    //let f4 = foods(image: "spanish", name: "Crazy Ones", type: "Spanish Food")
       
    //var foodslist: [foods] = []
    
    let foodslist = FavFood.foodslist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodlist.dataSource = self
        foodlist.delegate = self
        homebackground.image = UIImage(named: "homeback")
        myfood.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        myfood.font = UIFont(name: "RockSalt", size: 56)
      //  foodslist = [f1, f2, f3, f4]
        //foodslist.append(f2)
//        foodlist.rowHeight = UITableView.automaticDimension
//        foodlist.estimatedRowHeight = 600
        foodlist.rowHeight = 150
        // Do any additional setup after loading the view.
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodslist.count
    }
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell") as? MyFoodTableViewCell{
            cell.resname.text = foodslist[indexPath.row].name
            cell.resname.font = UIFont(name: "RockSalt", size:20)
            cell.restype.text = foodslist[indexPath.row].type
            cell.restype.font = UIFont(name: "RockSalt", size:12)
           // cell.resfood.image = foodslist[indexPath.row].image
            fetchImage(link: foodslist[indexPath.row].imageURL, imageView: cell.resfood)
            cell.contentView.backgroundColor = UIColor(red: 0.848, green: 0.856, blue: 0.862, alpha: 1)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func fetchImage(link: String, imageView: UIImageView?){
           let imageURL = URL(string: link)
           var image: UIImage?
           if let url = imageURL {
               //All network operations has to run on different thread(not on main thread).
               DispatchQueue.global(qos: .userInitiated).async {
                   let imageData = NSData(contentsOf: url)
                   //All UI operations has to run on main thread.
                   DispatchQueue.main.async {
                       if imageData != nil && imageView != nil  {
                           image = UIImage(data: imageData as! Data)
                           imageView!.image = image
                           imageView!.sizeToFit()
                       } else {
                           image = UIImage()
                       }
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
