//
//  ViewController.swift
//  Calculator
//
//  Created by Fumiya Sugiura on 2020/11/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    
    var ope: Int = 0    // 0: entering number, 1: plus, 2: minus, 3: multiply, 4: divide

    var isError: Bool = false
    
    func selectNumber(number: Int){
        number1 = number1*10 + number
        number3 = 0
        mainLabel.text = String(number1)
    }
    
    @IBAction func select1(){
        selectNumber(number: 1)
    }
    @IBAction func select2(){
        selectNumber(number: 2)
    }
    @IBAction func select3(){
        selectNumber(number: 3)
    }
    @IBAction func select4(){
        selectNumber(number: 4)
    }
    @IBAction func select5(){
        selectNumber(number: 5)
    }
    @IBAction func select6(){
        selectNumber(number: 6)
    }
    @IBAction func select7(){
        selectNumber(number: 7)
    }
    @IBAction func select8(){
        selectNumber(number: 8)
    }
    @IBAction func select9(){
        selectNumber(number: 9)
    }
    @IBAction func select0(){
        selectNumber(number: 0)
    }
    

    func moveNumber(){
        if number3 != 0 {
            number2 = number3
            number3 = 0
        }else{
            number2 = number1
            number1 = 0
        }
        if isError{
            initialization()
        }else{
            mainLabel.text = String(number2)
        }
    }
    
    func calculate(){
        switch(ope){
        case 1:
            number1 = number2 + number1
        case 2:
            number1 = number2 - number1
        case 3:
            number1 = number2 * number1
        case 4:
            if number1 == 0{
                mainLabel.text = String("0でわることはできません")
                isError = true
                return
            }
            number1 = number2 / number1
        default:
            return
        }
    }
    
    @IBAction func plus(){
        calculate()
        moveNumber()
        ope = 1
    }
    @IBAction func minus(){
        calculate()
        moveNumber()
        ope = 2
    }
    @IBAction func multiply(){
        calculate()
        moveNumber()
        ope = 3
    }
    @IBAction func divide(){
        calculate()
        moveNumber()
        ope = 4
    }
    
    func initialization(){
        number1 = 0
        number2 = 0
        number3 = 0
        ope = 0
        isError = false
    }
    
    @IBAction func equal(){
        calculate()
        number3 = number1
        number1 = 0
        number2 = 0
        ope = 0
        if isError{
            initialization()
        }else{
            mainLabel.text = String(number3)
        }
    }
    
    @IBAction func clear(){
        initialization()
        mainLabel.text = String(0)
    }
}

