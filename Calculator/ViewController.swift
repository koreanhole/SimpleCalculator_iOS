//
//  ViewController.swift
//  Calculator
//
//  Created by koreanhole on 23/08/2019.
//  Copyright © 2019 권순형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var resultNumber: Double = 0
    var operation = 0
    var storeOperationButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!

    
    @IBAction func numbersTapped(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + String(sender.tag-1)
    } //숫자 버튼을 눌렀을때 반응, tag = 숫자 + 1
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearResultLabel()
        clearVariables()
    }
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        operation = sender.tag
        firstNumber = Double(resultLabel.text!)!
        clearResultLabel()
        buttonColorInversion(button: sender)
        storeOperationButton = sender
    }
    
    @IBAction func reversePlusMinus(_ sender: UIButton) {
        var reverseObject = Double(resultLabel.text!)!
        reverseObject *= -1
        displayRightNumber(number: reverseObject)
    }
    @IBAction func percentaging(_ sender: UIButton) {
        var percentagingObject = Double(resultLabel.text!)!
        percentagingObject /= 100
        displayRightNumber(number: percentagingObject)
    }
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        secondNumber = Double(resultLabel.text!)!
        if operation == 11 {
            resultNumber = (firstNumber + secondNumber)
        } //plus operation
        else if operation == 12{
            resultNumber = (firstNumber - secondNumber)
        } //minus operation
        else if operation == 13{
            resultNumber = (firstNumber * secondNumber)
        } //multiply operation
        else if operation == 14{
            resultNumber = (firstNumber / secondNumber)
        } //divide operation
        displayRightNumber(number: resultNumber)
        restoreButtonColor(button: storeOperationButton)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func clearResultLabel() {
        resultLabel.text = ""
    }//result label을 초기화 시키는 함수
    func clearVariables() {
        firstNumber = 0
        secondNumber = 0
        resultNumber = 0
        operation = 0
    }
    func isItInteger(number: Double) -> Bool {
        if floor(number) == number {
            return true
        }
        else{
            return false
        }
    } //인수가 정수인지 소숫점있는 숫자인지 판별하는 함수

    func buttonColorInversion(button: UIButton) {
        if button.isHighlighted {
            button.setTitleColor(.red, for: .normal)
            button.backgroundColor = .black
        }
    } //연산자 기호 버튼을 눌렀을때 색반전을 주는 함수
    func restoreButtonColor(button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
    } //색반전된 버튼의 색깔을 원래대로 바꾸는 함수
    func displayRightNumber(number: Double) {
        if isItInteger(number: number) {
            resultLabel.text = String(Int(number))
        }
        else{
            resultLabel.text = String(number)
        }
    }
}

