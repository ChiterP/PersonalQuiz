//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var YoyAreAnimal: UILabel!
    @IBOutlet weak var DiscriptionAnimal: UILabel!
    
    
    //MARK: - Public properties
    var answersChoosen: [Answer]!
     
    //MARK: - Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        getAnimalDiscription()
    }
    
    //MARK: - Private Methods
    private func getAnimalDiscription() {

        var arrayCountType = [AnimalType: Int]()
                
        for answer in answersChoosen {
               arrayCountType [answer.type, default: 0] += 1
        }
         
        guard let max = arrayCountType.max (by: { (lhs, rhs) -> Bool in
            lhs.value < rhs.value
        }) else { return }
       
        DiscriptionAnimal.text = max.key.definition
        YoyAreAnimal.text = "Вы - " + String(max.key.rawValue)
    }
}


