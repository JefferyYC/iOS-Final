//
//  FavFood.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/28/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase


var userfood = FavFood()

class FavFood {
    struct foods {
              var imageURL: String
              var name: String
              var type: String
          }
    //static var foodslist: [foods] = [foods(image: UIImage(named: "duck"), name: "DaDong", type: "Chinese Food")]
    var foodslist: [foods] = []
    let db = Firestore.firestore()
    let useremail = Auth.auth().currentUser!.email
    func fetch() {
          db.collection("foodlist").whereField("user", isEqualTo: useremail!).getDocuments { (QueryFl, err) in
          if let err = err{
              print("Error getting foodlist")
          } else {
              for doc in QueryFl!.documents{
                  let img = doc.data()["image"] as! String
                  let na = doc.data()["name"] as! String
                  let ty = doc.data()["type"] as! String
                  self.foodslist.append(FavFood.foods(imageURL: img, name: na, type: ty))
                  }
              print(self.foodslist.count)
              print("DONE FETCHING!")
              }
          }
      }
    
    func addfoodtouser(img: String, na: String, ty: String) {
        var ref: DocumentReference? = nil
        ref = db.collection("foodlist").addDocument(data: ["image": img, "name": na, "type": ty, "user": useremail!])
    }
    
}
