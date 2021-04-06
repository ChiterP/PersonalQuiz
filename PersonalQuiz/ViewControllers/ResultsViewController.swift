//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами (+)
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов (+)

    //MARK: - Public properties
    var answersChoosen: [Answer]!
    let typeDog = AnimalType.dog
    
    
    
    
    //MARK: - Ovveride methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        printAnswers()
    }

    
    
    func printAnswers (){
        var countDog = 0
        var countTuryle = 0
        var countRabbit = 0
        var countCat = 0
        
        for answer in answersChoosen {
            
            switch answer.type {
            case AnimalType.dog:
                countDog += 1
            case AnimalType.turtle:
                countTuryle += 1
            case AnimalType.rabbit:
                countRabbit += 1
            default:
                countCat += 1
            }
        
            
            
            print ("Собака \(countDog)")
            print ("Черепаха \(countTuryle)")
            print ("Кролик \(countRabbit)")
            print ("Кошка \(countCat)")
        }
    }
}
