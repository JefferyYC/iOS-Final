//
//  SurveyViewController.swift
//  GoFood
//
//  Created by Jeffery Chen on 4/20/20.
//  Copyright © 2020 iOS Decal. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var goFood: UIButton!
    @IBOutlet weak var SurveyTableView: UITableView!
    
    struct SurveyQuestion {
        var q: String
        var op1: String
        var op2: String
    }
    
    let q1 = SurveyQuestion(q: "How are you doing today?", op1: "Busy", op2: "Chilling")
    let q2 = SurveyQuestion(q: "Feeling adventurous?", op1: "Yes!", op2: "Not Really")
    let q3 = SurveyQuestion(q: "What about budget?", op1: "$$$$", op2: "$")
    let q4 = SurveyQuestion(q: "Down to exercise?", op1: "walk", op2: "drive")
    let q5 = SurveyQuestion(q: "Asian food?", op1: "Yes!", op2: "meh")
    let q6 = SurveyQuestion(q: "Western food?", op1: "Yes!", op2: "meh")
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setting background
        background.image = UIImage(named: "surveyBG")
        
        //setting upper right text
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
        questions = [q1, q2, q3, q4, q5, q6]
        SurveyTableView.delegate = self
        SurveyTableView.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findFood(_ sender: UIButton) {
        var index = 0
        for cell in self.SurveyTableView!.visibleCells {
            let surveyCell = cell as! SurveyTableViewCell
            updatePreference(index: index, onePressed: surveyCell.onePressed)
            index += 1
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? UIButton, let dest = segue.destination as? GoFoodViewController {
            dest.yelpName = "Kiraku"
            dest.yelpLabel = "Japanese Food"
            dest.yelpReview = "Everything is great. But I highly recommend the lucky box!"
            dest.yelpInfo = "⏰：5:00pm - 8:00pm\n\nPrice: $$\n\nYelp rating: ⭐️⭐️⭐️⭐️"
            dest.yelpPic1URL = "https://s3-media0.fl.yelpcdn.com/bphoto/0Uh2XjrVJf_jJXs9I4o3YQ/258s.jpg"
            dest.yelpPic2URL = "https://s3-media0.fl.yelpcdn.com/bphoto/xZd0ncowegEWn_JO-WKheg/258s.jpg"
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
