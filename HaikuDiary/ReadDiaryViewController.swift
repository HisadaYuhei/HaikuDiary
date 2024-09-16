//
//  ReadDiaryViewController.swift
//  HaikuDiary
//
//  Created by 久田　悠平 on 2024/09/16.
//

import UIKit

class ReadDiaryViewController: UIViewController {

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
    }


}
