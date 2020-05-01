//
//  GoFoodViewController.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/20/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import CoreLocation

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

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var DummyButton: UIButton!
    //variables to store information sent from survey page
    var yelpName: String = ""
    var yelpLabel: String = ""
    var yelpReview: String = ""
    var yelpInfo: String = ""
    var yelpPic1URL: String = "" //url for the picture
    var yelpPic2URL: String = ""
    let db = Firestore.firestore()
    let useremail = Auth.auth().currentUser!.email
    
    var yelpID: String = ""
    
    var locationManager: CLLocationManager! = CLLocationManager()
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    
    var APIKey = "Bearer nq6q8YuZMPqqPKY9Vd5uSTWvvIZIBJ72UibL-s5uhF8mGvY7m35xIXqdc7xWNgHeCVADssi638vzM3--CsHX0r6GJ6DHqS3TBVKNskgWUzJYicyGrEcLwaX7vRmqXnYx"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetch image
        fetchImage(link: yelpPic1URL, imageView: sample1Pic)
        fetchImage(link: yelpPic2URL, imageView: sample2Pic)

        //header part
        background.image = UIImage(named: "goFoodBG")
        restaurantName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantName.text = yelpName
        restaurantName.font = UIFont(name: "RockSalt", size: 30)
        restaurantType.text = yelpLabel
        restaurantType.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        restaurantType.font = UIFont(name: "RockSalt", size: 15)
        review.text = yelpReview
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
        info.text = yelpInfo
        
        //buttons
        setButton(button: dislikeButton, title: "❌")
        setButton(button: likeButton, title: "❤️")
        setButton(button: goFoodButton, title: "GoFood")
        goFoodButton.setTitleColor(UIColor(red: 0.996, green: 0.732, blue: 0.336, alpha: 1), for: .normal)
        goFoodButton.titleLabel?.font = UIFont(name: "RockSalt", size: 20)
        
        //signature dishes
        signature.text = "Signature Dish"
        signature.font = UIFont(name: "RockSalt", size: 30)
        
        
        //back
        backButton.setTitleColor(UIColor(red: 0.996, green: 0.732, blue: 0.336, alpha: 1), for: .normal)
        backButton.titleLabel?.font = UIFont(name: "RockSalt", size: 20)
        

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.longitude = locValue.longitude
        self.latitude = locValue.latitude
    }
    
    func setButton(button:UIButton, title: String) {
        button.backgroundColor = UIColor(red: 0.975, green: 0.944, blue: 0.865, alpha: 0.45)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.038, green: 0.037, blue: 0.037, alpha: 0.6).cgColor
        button.setTitle(title, for: .normal)
    }

    
    //todo: load image from URL
    func fetchImage(link: String, imageView: UIImageView?) -> UIImage? {
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
        return image
    }
    
    
    @IBAction func likeFood(_ sender: UIButton) {
        userfood.foodslist.append(FavFood.foods(imageURL: yelpPic1URL, name: yelpName, type: yelpLabel))
        userfood.addfoodtouser(img: yelpPic1URL, na: yelpName, ty: yelpLabel)
        queryYelpGeneral {
            self.queryYelpReview {
                self.queryYelpDetail {
                    self.performSegue(withIdentifier: "Dummy", sender: self.DummyButton)
                }
            }
        }
    }
    
    @IBAction func DislikeFood(_ sender: UIButton) {
        queryYelpGeneral {
            self.queryYelpReview {
                       self.queryYelpDetail {
                        self.performSegue(withIdentifier: "Dummy", sender: self.DummyButton)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? UIButton, let dest = segue.destination as? GoFoodViewController {
            dest.yelpName = self.yelpName
            dest.yelpLabel = self.yelpLabel
            dest.yelpReview = self.yelpReview
            dest.yelpInfo = self.yelpInfo
            dest.yelpPic1URL = self.yelpPic1URL
            dest.yelpPic2URL = self.yelpPic2URL
        }
    }
    
    func queryYelpGeneral(completion: @escaping () -> Void) {
        var r: String
        if Preference.walk {
            r = "1600"
        } else {
            r = "16000"
        }

        var p: String
        if Preference.budget {
            p = "2,3,4"
        } else {
            p = "1"
        }
        
        let urlstring = "https://api.yelp.com/v3/businesses/search?" + "latitude=" + String(self.latitude) + "&longitude=" + String(self.longitude) + "&radius=" + r + "&price=" + p + "&term=restaurants"
                
        var request = URLRequest(url: URL(string: urlstring)!)
        request.setValue(self.APIKey, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let yelpData = data else { return }
            let json = try? JSONSerialization.jsonObject(with: yelpData, options: [])
            guard let dictionary = json as? [String: Any] else { return }
            print(dictionary)
            guard let business = dictionary["businesses"] as? [[String: Any]] else { return }
            let i = Int.random(in: 0...business.count)
            guard let id = business[i]["id"] as? String else { return }
            self.yelpID = id
            completion()
           }.resume()
       }
       
       func queryYelpReview(completion: @escaping () -> Void) {
        let urlstring = "https://api.yelp.com/v3/businesses/" + self.yelpID + "/reviews"
           var request = URLRequest(url: URL(string: urlstring)!)
           request.setValue(self.APIKey, forHTTPHeaderField: "Authorization")
           
           URLSession.shared.dataTask(with: request) { (data, response, err) in
               guard let yelpData = data else { return }
               let json = try? JSONSerialization.jsonObject(with: yelpData, options: [])
               guard let dictionary = json as? [String: Any] else { return }
               //print(dictionary)
               guard let review = dictionary["reviews"] as? [[String: Any]] else { return }
               guard let text = review[0]["text"] as? String else { return }
               self.yelpReview = text
               
               completion()
           }.resume()
       }
       
       func queryYelpDetail(completion: @escaping () -> Void) {
           let urlstring = "https://api.yelp.com/v3/businesses/" + self.yelpID
           var request = URLRequest(url: URL(string: urlstring)!)
           request.setValue(self.APIKey, forHTTPHeaderField: "Authorization")
           
           URLSession.shared.dataTask(with: request) { (data, response, err) in
               guard let yelpData = data else { return }
               let json = try? JSONSerialization.jsonObject(with: yelpData, options: [])
               guard let dictionary = json as? [String: Any] else { return }
               //print(dictionary)
               guard let name = dictionary["name"] as? String else { return }
               self.yelpName = name
               //print("got name")
               guard let typeList = dictionary["categories"] as? [[String: Any]] else {return}
               guard let type = typeList[0]["title"] as? String else { return }
               self.yelpLabel = type
               //print("got label")
               guard let price = dictionary["price"] as? String else { return }
               guard let rating = dictionary["rating"] as? Double else { return }
               guard let time = dictionary["hours"] as? [[String: Any]] else { return }
               guard let open = time[0]["open"] as? [[String: Any]] else { return }
               guard let start = open[0]["start"] as? String else { return }
               guard let end = open[0]["end"] as? String else { return }
               self.yelpInfo = self.concatInfo(start: start, end: end, price: price, rating: rating)
               //print("got info")
               guard let photos = dictionary["photos"] as? [String] else { return }
               self.yelpPic1URL = photos[0]
               self.yelpPic2URL = photos[1]
               //print("got url")
               DispatchQueue.main.async {
                   completion()
               }
           }.resume()
       }
       
       func concatInfo(start: String, end: String, price: String, rating: Double) -> String {
           let startTime = start.prefix(2) + ":" + start.suffix(2)
           let endTime = end.prefix(2) + ":" + end.suffix(2)
           let star = String(repeating: "⭐️", count: Int(round(rating)))
           let res = "⏰: " + startTime + " - " + endTime + "\n\nPrice: " + price + "\n\nYelp rating: " + star
           return res
       }
    
//    func addfoodtouser(img: String, na: String, ty: String) {
//        var ref: DocumentReference? = nil
//        ref = db.collection("foodlist").addDocument(data: ["image": img, "name": na, "type": ty, "user": useremail!])
//    }
        
    
//    func fetch() {
//        db.collection("foodlist").whereField("user", isEqualTo: useremail).getDocuments { (QueryFl, err) in
//        if let err = err{
//            print("Error getting foodlist")
//        } else {
//            for doc in QueryFl!.documents{
//                let img = doc.data()["image"] as! String
//                let na = doc.data()["name"] as! String
//                let ty = doc.data()["type"] as! String
//                FavFood.foodslist.append(FavFood.foods(imageURL: img, name: na, type: ty))
//                }
//            print(FavFood.foodslist.count)
//            print("DONE FETCHING!")
//            }
//        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
