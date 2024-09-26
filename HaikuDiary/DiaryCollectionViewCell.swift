//
//  DiaryCollectionViewCell.swift
//  HaikuDiary
//
//  Created by 久田　悠平 on 2024/09/16.
//

import UIKit

class DiaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var frontLabel: UILabel!
    @IBOutlet var middleLabel: UILabel!
    @IBOutlet var lastLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    var fronts : String?
    var middles : String?
    var lasts: String?
    
    var dates: String?
    
    func setUp(frontText: String, middleText: String, lastText: String, dateText: String){
        let front_verticalText = frontText.map { String($0) }.joined(separator: "\n")
        let middle_verticalText = middleText.map { String($0) }.joined(separator: "\n")
        let last_verticalText = lastText.map { String($0) }.joined(separator: "\n")
        
        frontLabel.numberOfLines = 0  // 無制限に行を表示する設定
        frontLabel.textAlignment = .center // 中央揃え（オプション）
        frontLabel.text = front_verticalText
        frontLabel.sizeToFit()
        
        middleLabel.numberOfLines = 0  // 無制限に行を表示する設定
        middleLabel.textAlignment = .center // 中央揃え（オプション）
        middleLabel.text = middle_verticalText
        middleLabel.sizeToFit()
        
        lastLabel.numberOfLines = 0  // 無制限に行を表示する設定
        lastLabel.textAlignment = .center // 中央揃え（オプション）
        lastLabel.text = last_verticalText
        lastLabel.sizeToFit()
        
        dateLabel.text = dateText
        
//        frontLabel.frame = CGRect(x: 225, y: 200, width: 100, height: 300)
//        middleLabel.frame = CGRect(x: 150, y: 300, width: 100, height: 300)
//        lastLabel.frame = CGRect(x: 75, y: 400, width: 100, height: 300)
        
        self.addSubview(frontLabel)
        self.addSubview(middleLabel)
        self.addSubview(lastLabel)
        self.addSubview(dateLabel)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
