//
//  ViewController.swift
//  guess_the_flag
//
//  Created by Chris Jordan on 29/06/2016.
//  Copyright © 2016 Chris Jordan. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    private var countries = [String]()
    private var correctAnswer = 0
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountries()
        askQuestion()
    }
    
    private func formatFlags() {
        addBorder(button1)
        addBorder(button2)
        addBorder(button3)
    }
    
    private func askQuestion(action: UIAlertAction! = nil) {
        randomizeCountries()
        formatFlags()

        setFlag(button1, country: countries[0])
        setFlag(button2, country: countries[1])
        setFlag(button3, country: countries[2])
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }
    
    private func setFlag(button: UIButton, country: String) {
        button.setImage(UIImage(named: country), forState: .Normal)
    }
    
    private func addBorder(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    @IBAction func flagTapped(tappedFlag: UIButton) {
        if tappedFlag.tag == correctAnswer {
            score += 1
            highlightCorrectFlag(tappedFlag)
        } else {
            score -= 1
            highlightIncorrectFlag(tappedFlag)
        }
        
        scoreLabel.text = "\(score) points"
        playAgain()
    }
 
    private func highlightCorrectFlag(button: UIButton) {
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.greenColor().CGColor
    }
    
    private func highlightIncorrectFlag(button: UIButton) {
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.redColor().CGColor
    }

//This shows how to pop up a message based on the score, and is here for reference only
//    @IBAction func flagTapped(sender: UIButton) {
//        var popupTitle: String
//        if sender.tag == correctAnswer {
//            
//            popupTitle = "Well done"
//            score += 1
//            
//        } else {
//            popupTitle = "That's wrong"
//            score -= 1
//        }
//        
//        
//        let alertController = UIAlertController(title: popupTitle, message: "Your score is \(score)", preferredStyle: .ActionSheet)
//        alertController.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
//        presentViewController(alertController, animated: true, completion: nil)
//    }
    
    private func playAgain() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.askQuestion()
        }
    }

    private func loadCountries() {
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    
    private func randomizeCountries() {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

