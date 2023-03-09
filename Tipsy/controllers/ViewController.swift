//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    //tipChanged（0％.10％.20％）ボタンを変化させた時のアクション
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //安全にアンラップし末尾の％を消し浮動小数点表示の20.00表示にし,20.00を100で割って出た数値0.2をtipに代入する
        guard let buttonTitle = sender.currentTitle else { return }
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        guard let buttonTitleAsAnswer = Double(buttonTitleMinusPercentSign) else { return }
        tip = buttonTitleAsAnswer / 100
        
        //選択されたButtonのみ見た目を変化させる処理
        //更新処理がある場合はgaurdの後ろで実行
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentPctButton.isSelected = false
        sender.isSelected = true
        
    }
    
    
    
    //split値を変化させた時のアクション
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //splitNumberLabelのtextとnumberOfPeopleを整数で表示させる
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    
    //calculateボタンを押した時のアクション
    @IBAction func calculatePressed(_ sender: UIButton) {
        //billTextFieldが空白でない場合そのtextと(1.0 + tip)を掛けてnumberOfPeopleで割ったresultを小数点以下2桁まで表示させる
        //Stringの空文字判定はisEmptyを使う
        guard let bill = billTextField.text, !bill.isEmpty else { return }
        guard let billTotal = Double(bill) else { return }
        let result = billTotal * (1.0 + tip) / Double(numberOfPeople)
        finalResult = String(format: "%.2f", result)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    
    //セグエでResultViewControllerに伝送するための処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //セグエのidentiferがgoToResultと等しかったら各々のデータを伝送先へ出力する
        guard segue.identifier == "goToResult", let destinationVC = segue.destination as? ResultsViewController else { return }
        destinationVC.result = finalResult
        destinationVC.tip = Int(tip * 100)
        destinationVC.split = numberOfPeople
    }
}

