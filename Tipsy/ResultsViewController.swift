//  ResultsViewController.swift
//  Tipsy
//  Created by 内田麻美 on 2022/11/24.
//  Copyright © 2022 The App Brewery. All rights reserved.

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //変数を定義
    var result = "0.0"
    var tip = 10
    var split = 2
    
    //ResultsviewControllerに画面が移動した
    override func viewDidLoad() {
        //セグエで伝送させてきたresult,tip,splitを出力させる
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split)people,with \(tip)% tip"
    }
    
    //recalculatePressedを押した時のアクション
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //元画面viewControllerに戻る
        self.dismiss(animated: true, completion: nil)
    }
}


