//
//  ReadPastViewController.swift
//  HaikuDiary
//
//  Created by 久田　悠平 on 2024/09/26.
//

import Foundation
 
import UIKit
 
class ReadPastViewController: UIViewController{
    
    var fronts : String?
    var middles : String?
    var lasts: String?
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frontLabel.text = fronts
        middleLabel.text = middles
        lastLabel.text = lasts
        
        let fronttext: String = frontLabel.text ?? ""
        let middletext: String = middleLabel.text ?? ""
        let lasttext: String = lastLabel.text ?? ""
        
        let front_verticalText = fronttext.map { String($0) }.joined(separator: "\n")
        let middle_verticalText = middletext.map { String($0) }.joined(separator: "\n")
        let lasts_verticalText = lasttext.map { String($0) }.joined(separator: "\n")
        
        // UILabelを作成して設定
        frontLabel.text = front_verticalText
        frontLabel.numberOfLines = 0  // 無制限に行を表示する設定
        frontLabel.textAlignment = .center // 中央揃え（オプション）
        
        middleLabel.text = middle_verticalText
        middleLabel.numberOfLines = 0  // 無制限に行を表示する設定
        middleLabel.textAlignment = .center // 中央揃え（オプション）
        
        lastLabel.text = lasts_verticalText
        lastLabel.numberOfLines = 0  // 無制限に行を表示する設定
        lastLabel.textAlignment = .center // 中央揃え（オプション）

        // ラベルのサイズと位置を設定
        frontLabel.frame = CGRect(x: 225, y: 200, width: 100, height: 300)
        middleLabel.frame = CGRect(x: 150, y: 300, width: 100, height: 300)
        lastLabel.frame = CGRect(x: 75, y: 400, width: 100, height: 300)
        
        // ビューに追加
        view.addSubview(frontLabel)
        view.addSubview(middleLabel)
        view.addSubview(lastLabel)
    }
}
