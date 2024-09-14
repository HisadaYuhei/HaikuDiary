//
//  ViewController.swift
//  HaikuDiary
//
//  Created by 久田　悠平 on 2024/09/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTestButton()
        // Do any additional setup after loading the view.
    }
    
    func configureTestButton() {
        //ボタンを丸くする処理．ボタンが正方形の時，一辺を2で割った数値を入れる(ボタンのサイズは70×70であるので35)
        testButton.layer.cornerRadius = 35
        //影の色を指定。(UIColorをCGColorに変換している)
        testButton.layer.shadowColor = UIColor.black.cgColor
        //影の縁のぼかしの強さを指定
        testButton.layer.shadowRadius = 3
        //影の位置を指定
        testButton.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        //影の不透明度(濃さ)を指定
        testButton.layer.shadowOpacity = 1.0
    }



}

