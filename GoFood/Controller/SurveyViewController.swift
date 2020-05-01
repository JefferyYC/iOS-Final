//
//  SurveyViewController.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/20/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit
import CoreLocation

class SurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var goFood: UIButton!
    @IBOutlet weak var SurveyTableView: UITableView!
    
    var yelpName: String = ""
    var yelpLabel: String = ""
    var yelpReview: String = ""
    var yelpInfo: String = ""
    var yelpPic1URL: String = "" //url for the picture
    var yelpPic2URL: String = ""
    
    var yelpID: String = "WavvLdfdP6g8aZTtbBQHTw"
    
    var locationManager: CLLocationManager! = CLLocationManager()
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    
    struct SurveyQuestion {
        var q: String
        var op1: String
        var op2: String
    }
    
    var APIKey = "Bearer nq6q8YuZMPqqPKY9Vd5uSTWvvIZIBJ72UibL-s5uhF8mGvY7m35xIXqdc7xWNgHeCVADssi638vzM3--CsHX0r6GJ6DHqS3TBVKNskgWUzJYicyGrEcLwaX7vRmqXnYx"
    
    let q1 = SurveyQuestion(q: "How Are You Doing Today?", op1: "Busy", op2: "Chilling")
    let q2 = SurveyQuestion(q: "Feeling Adventurous?", op1: "Yes!", op2: "Not Really")
    let q3 = SurveyQuestion(q: "What about Budget?", op1: "$$$$", op2: "$")
    let q4 = SurveyQuestion(q: "Down to Exercise?", op1: "Walk", op2: "Drive")
    let q5 = SurveyQuestion(q: "On a Diet now?", op1: "Yes!", op2: "Not Really")
//    let q6 = SurveyQuestion(q: "Western food?", op1: "Yes!", op2: "meh")
    var questions: [SurveyQuestion]!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SurveyCell") as? SurveyTableViewCell {
            cell.question.text = questions[indexPath.row].q
            cell.optionOne.setTitle(questions[indexPath.row].op1, for: .normal)
            cell.optionTwo.setTitle(questions[indexPath.row].op2, for: .normal)
            return cell
        }
        return UITableViewCell()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.longitude = locValue.longitude
        self.latitude = locValue.latitude
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setting background
        background.image = UIImage(named: "surveyBG")
        
        //setting upper right text
        let da = Date()
        let calendar = Calendar.current
        let m = calendar.component(.month, from: da)
        let d = calendar.component(.day, from: da)
        let w = calendar.component(.weekday, from: da)
        date.text = getWeekDay(day: w) + " " + String(m) + "/" +  String(d)
        
        date.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        date.font = UIFont(name: "RockSalt", size: 30)
        temperature.textColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1)
        temperature.font = UIFont(name: "RockSalt", size: 30)
        
        //setting goFood button
        goFood.setTitle("GoFood!", for: .normal)
        goFood.setTitleColor(UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1), for: .normal)
        goFood.titleLabel!.font = UIFont(name: "RockSalt", size: 30)
        goFood.clipsToBounds = true
        goFood.layer.cornerRadius = 30
        goFood.layer.borderWidth = 3
        goFood.layer.borderColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1).cgColor
        
        //setting tableview
        questions = [q1, q2, q3, q4, q5]
        SurveyTableView.delegate = self
        SurveyTableView.dataSource = self
        
        //initialize location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
            
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findFood(_ sender: UIButton) {
        var index = 0
        for cell in self.SurveyTableView!.visibleCells {
            let surveyCell = cell as! SurveyTableViewCell
            updatePreference(index: index, onePressed: surveyCell.onePressed)
            index += 1
        }
        
        queryYelpGeneral {
            self.queryYelpReview {
                       self.queryYelpDetail {
                                 self.performSegue(withIdentifier: "GoFood", sender: sender)
                }
            }
        }
    }
    
    func updatePreference(index: Int, onePressed: Bool) {
        if index == 0 {
            Preference.busy = onePressed
        } else if index == 1 {
            Preference.new = onePressed
        } else if index == 2 {
            Preference.budget = onePressed
        } else if index == 3 {
            Preference.walk = onePressed
        } else if index == 4 {
            Preference.asian = onePressed
        } else if index == 5 {
            Preference.western = onePressed
        }
    }
    
    func getWeekDay(day: Int) -> String {
        switch day {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return ""
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
            //print(dictionary)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //
}
