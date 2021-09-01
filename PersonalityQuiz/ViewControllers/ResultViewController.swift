//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    private var currentAnimal: Animal?
    
    var answers: [Answer] = [] {
        didSet {
            currentAnimal = answers.sorted(by: { answer1, answer2 -> Bool in
                answer1.animal.rawValue < answer2.animal.rawValue
            }
            ) .randomElement()?.animal
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let animal = currentAnimal else {
            return
        }
        titleLabel.text = "ВЫ - \(animal.rawValue)"
        subtitleLabel.text = animal.definition
        
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
}
