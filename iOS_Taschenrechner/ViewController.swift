//
//  ViewController.swift
//  iOS_Taschenrechner
//
//  Created by Turk on 06.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var userIsInTheMiddleOfTyping : Bool = false;
    var decimalusing : Bool = false;
    var firstNum : Double = 0.0;
    var secondNum : Double = 0.0;
    var result : Double = 0.0;
    var choosingOperator : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numButtonTapped(_ sender: RoundButton) {
        print(sender.titleLabel!.text!)
        var key = sender.titleLabel!.text!
        
        key = (key == ",") ? "." : key;
        
        if(userIsInTheMiddleOfTyping == true){
            if(decimalusing == true && key == "."){
                key = "";
            }
            resultLabel.text = resultLabel.text! + key;
        }else{
            resultLabel.text = key;
            userIsInTheMiddleOfTyping = true;
        }
        
        if(key == "."){
            decimalusing = true;
        }
        
    }
    
    @IBAction func equalButtonTapped(_ sender: RoundButton) {
        secondNum = Double(resultLabel.text!)!;
        calculat(_operator: choosingOperator);
        resultLabel.text = String(format: "%.2f", result);
        userIsInTheMiddleOfTyping = false;
        decimalusing = false;
    }
    
    //AC/DC Button
    @IBAction func clearButtonTapped(_ sender: RoundButton) {
        firstNum = 0;
        secondNum = 0;
        result = 0;
        choosingOperator = "";
        resultLabel.text = "0";
        decimalusing = false;
    }
    
    @IBAction func operationButtonTapped(_ sender: RoundButton) {
        print(sender.titleLabel!.text!);
        if(resultLabel.text! != "."){
            firstNum = Double(resultLabel.text!)!
            userIsInTheMiddleOfTyping = false;
            choosingOperator = sender.titleLabel!.text!;
            decimalusing = false;
        }
    }
    
    func calculat(_operator : String){
        switch _operator {
        case "➕":
            result = firstNum + secondNum;
        case "➖":
            result = firstNum - secondNum;
        case "✖️":
            result = firstNum * secondNum;
        case "➗":
            result = firstNum / secondNum;
        default:
            break;
        }
    }
}

