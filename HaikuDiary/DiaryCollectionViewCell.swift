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
    
    func setUp(frontText: String, middleText: String, lastText: String){
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
        
//        frontLabel.frame = CGRect(x: 225, y: 200, width: 100, height: 300)
//        middleLabel.frame = CGRect(x: 150, y: 300, width: 100, height: 300)
//        lastLabel.frame = CGRect(x: 75, y: 400, width: 100, height: 300)
        
        self.addSubview(frontLabel)
        self.addSubview(middleLabel)
        self.addSubview(lastLabel)
    }
    
    
//    var front: String = ""
//    var middle: String = ""
//    var last: String = ""
    
    var fronts : String?
    var middles : String?
    var lasts: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // ラベルに縦書きテキストを設定
//        setVerticalText(for: frontLabel, text: "前のテキスト")
//        setVerticalText(for: middleLabel, text: "真ん中のテキスト")
//        setVerticalText(for: lastLabel, text: "最後のテキスト")
//                
//        // contentViewを90度回転させる
//        contentView.transform = CGAffineTransform(rotationAngle: .pi / 2)
//        contentView.frame = bounds
//        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        frontLabel.text = fronts
//        middleLabel.text = middles
//        lastLabel.text = lasts
//        
//        let fronttext: String = frontLabel.text ?? ""
//        let middletext: String = middleLabel.text ?? ""
//        let lasttext: String = lastLabel.text ?? ""
//        
//        let front_verticalText = fronttext.map { String($0) }.joined(separator: "\n")
//        let middle_verticalText = middletext.map { String($0) }.joined(separator: "\n")
//        let last_verticalText = lasttext.map { String($0) }.joined(separator: "\n")
//        
//        // UILabelを作成して設定
//        frontLabel.text = front_verticalText
//        frontLabel.numberOfLines = 0  // 無制限に行を表示する設定
//        frontLabel.textAlignment = .center // 中央揃え（オプション）
//        frontLabel.sizeToFit()
//        
//        middleLabel.text = middle_verticalText
//        middleLabel.numberOfLines = 0  // 無制限に行を表示する設定
//        middleLabel.textAlignment = .center // 中央揃え（オプション）
//        middleLabel.sizeToFit()
//        
//        lastLabel.text = last_verticalText
//        lastLabel.numberOfLines = 0  // 無制限に行を表示する設定
//        lastLabel.textAlignment = .center // 中央揃え（オプション）
//        lastLabel.sizeToFit()

//        // ラベルのサイズと位置を設定
//        frontLabel.frame = CGRect(x: 225, y: 200, width: 100, height: 300)
//        middleLabel.frame = CGRect(x: 150, y: 300, width: 100, height: 300)
//        lastLabel.frame = CGRect(x: 75, y: 400, width: 100, height: 300)
        
//        // ビューに追加
//        self.addSubview(frontLabel)
//        self.addSubview(middleLabel)
//        self.addSubview(lastLabel)
    }
    
//    // 縦書きテキストをUILabelに設定するヘルパーメソッド
//    func setVerticalText(for label: UILabel, text: String) {
//        let attributedString = NSMutableAttributedString(string: text)
//        
//        // 文字全体に縦書き属性を設定
//        attributedString.addAttribute(.verticalGlyphForm, value: 1, range: NSRange(location: 0, length:attributedString.length))
//
//            label.attributedText = attributedString
//            label.numberOfLines = 0  // 複数行表示（縦書き）の設定
//            label.textAlignment = .center  // 中央揃え（オプション）
//        }
//
//    // ビューポートの調整 (contentOffsetを使わず、boundsに基づく)
//    func viewportBounds(for textViewportLayoutController: NSTextViewportLayoutController) -> CGRect {
//        return bounds.insetBy(dx: 0, dy: -100)
//    }
}
