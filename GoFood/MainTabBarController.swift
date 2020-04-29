//
//  MainTabBarController.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/28/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTabBar()
        
    }
    
    func setTabBar() {
        //setting tabbar  item
        let barItem1 = (self.tabBar.items?[0])! as UITabBarItem
        barItem1.image = UIImage(named:"rice")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        barItem1.selectedImage = UIImage(named:"rice")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        barItem1.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        barItem1.title = nil
        
        let barItem2 = (self.tabBar.items?[1])! as UITabBarItem
        barItem2.image = UIImage(named:"dish")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        barItem2.selectedImage = UIImage(named:"dish")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        barItem2.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        barItem2.title = nil
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
