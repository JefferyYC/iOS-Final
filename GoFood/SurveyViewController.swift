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
    var questions: [SurveyQuestion]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SurveyCell") as? SurveyTableViewCell {
            cell.question.text = questions[indexPath.row].q
            cell.optionOne.setTitle(questions[indexPath.row].op1, for: .normal)
            cell.optionTwo.setTitle(questions[indexPath.row].op2, for: .normal)
            cell.optionOne.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
            cell.optionTwo.setTitleColor(UIColor(cgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor), for: .normal)
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
        //layer code that does not work
        /*let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = goFood.bounds
        layer1.position = goFood.center
        goFood.layer.addSublayer(layer1)*/
        goFood.layer.cornerRadius = 30
        goFood.layer.borderWidth = 3
        goFood.layer.borderColor = UIColor(red: 1, green: 0.795, blue: 0.488, alpha: 1).cgColor
        
        //setting tableview
        questions = [q1, q2, q3, q4]
        SurveyTableView.delegate = self
        SurveyTableView.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? UIButton, let dest = segue.destination as? GoFoodViewController {
            dest.yelpName = "Test sender"
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
