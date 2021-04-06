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
    
    
    //MARK: - IB Outlets
    @IBOutlet weak var YoyAreAnimal: UILabel!
    @IBOutlet weak var DiscriptionAnimal: UILabel!
    
    
    //MARK: - Public properties
    var answersChoosen: [Answer]!
     
    
    //MARK: - Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        printAnswers()
    }
    
    
    //MARK: - Private Methods
    private func printAnswers() {

        var countDog = 0
        var countTurtle = 0
        var countRabbit = 0
        var countCat = 0
        
        var arrayCountType = [AnimalType: Int]()
        
        var arrayCount = [Int]()
        
        for answer in answersChoosen {
            switch answer.type {
            case AnimalType.dog:
                countDog += 1
                arrayCountType [answer.type] = countDog
            case AnimalType.turtle:
                countTurtle += 1
                arrayCountType [answer.type] = countTurtle
            case AnimalType.rabbit:
                countRabbit += 1
                arrayCountType [answer.type] = countRabbit
            default:
                countCat += 1
                arrayCountType [answer.type] = countCat

            }
        }
        
        print ("Справочник итог \(arrayCountType)")
       
        arrayCount.append(countDog)
        arrayCount.append(countCat)
        arrayCount.append(countRabbit)
        arrayCount.append(countTurtle)

        print ("Массив итог \(arrayCount)")
        
        let intMax = arrayCount.max()!
        let indexMax = arrayCount.firstIndex(of: intMax)
        
        
        if indexMax == 0 {
            print ("Собака \(countDog)")
            print ("\(AnimalType.dog.definition)")
            DiscriptionAnimal.text = AnimalType.dog.definition
            YoyAreAnimal.text = "Вы - " + String(AnimalType.dog.rawValue)
        }
        if indexMax == 1 {
            print ("Кошка \(countCat)")
            print ("\(AnimalType.cat.definition)")
            DiscriptionAnimal.text = AnimalType.cat.definition
            YoyAreAnimal.text = "Вы - " + String(AnimalType.cat.rawValue)
        }
        if indexMax == 2{
            print ("Кролик \(countRabbit)")
            print ("\(AnimalType.rabbit.definition)")
            DiscriptionAnimal.text = AnimalType.rabbit.definition
            YoyAreAnimal.text = "Вы - " + String(AnimalType.rabbit.rawValue)
        }
        if indexMax == 3{
            print ("Черепаха \(countTurtle)")
            print ("\(AnimalType.turtle.definition)")
            DiscriptionAnimal.text = AnimalType.turtle.definition
            YoyAreAnimal.text = "Вы - " + String(AnimalType.turtle.rawValue)
        }
        

        
        for (animal, countAnimal) in zip(arrayCountType, arrayCount)  {
            if intMax == countAnimal {
                print("Проверка по словарю \(animal), \(countAnimal), \(intMax)")
            } else { return }

        }
        
        
    }
}


