import UIKit

class WriteDiaryViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var frontTextField: UITextField!
    @IBOutlet weak var middleTextField: UITextField!
    @IBOutlet weak var lastTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var fronts: [String] = []
    var middles: [String] = []
    var lasts: [String] = []
    var contents: [String] = []
    var dates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.cornerRadius = 5
        contentTextView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // デフォルトの値を登録
        saveData.register(defaults: ["fronts": [], "middles": [], "lasts": [], "contents": [], "dates": []])
        
        // UserDefaultsから保存されたデータを読み込む（安全にキャスト）
        if let savedFronts = saveData.object(forKey: "fronts") as? [String] {
            fronts = savedFronts
        }
        
        if let savedMiddles = saveData.object(forKey: "middles") as? [String] {
            middles = savedMiddles
        }
        
        if let savedLasts = saveData.object(forKey: "lasts") as? [String] {
            lasts = savedLasts
        }
        
        if let savedContents = saveData.object(forKey: "contents") as? [String] {
            contents = savedContents
        }
        
        if let savedDates = saveData.object(forKey: "dates") as? [String] {
            dates = savedDates
        }

        frontTextField.delegate = self
        middleTextField.delegate = self
        lastTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // キーボードを閉じる
        return true
    }
    
//    func readFronts()->String{
//        return fronts
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ReadDiaryViewController
        let front  = frontTextField.text
        let middle = middleTextField.text
        let last  = lastTextField.text
        
        destinationVC.fronts  = front
        destinationVC.middles = middle
        destinationVC.lasts   = last
    }
    
    @IBAction func save(_ sender: Any) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP") // 日本語のロケールを設定
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let date_all = formatter.string(from: date)
        print(date_all)
        
        guard let front = frontTextField.text, !front.isEmpty,
              let middle = middleTextField.text, !middle.isEmpty,
              let last = lastTextField.text, !last.isEmpty
              //let content = contentTextView.text, !content.isEmpty
        else {
            // タイトルまたは内容が空の場合、エラーメッセージを表示
            let alert = UIAlertController(title: "エラー", message: "入力されていません", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        let content = contentTextView.text ?? ""
        
        // タイトルと内容を配列に追加
        fronts.append(front)
        middles.append(middle)
        lasts.append(last)
        contents.append(content)
        dates.append(date_all)
        
        
        // UserDefaultsに保存（配列全体を保存）
        saveData.set(fronts, forKey: "fronts")
        saveData.set(middles, forKey: "middles")
        saveData.set(lasts, forKey: "lasts")
        saveData.set(contents, forKey: "contents")
        saveData.set(dates, forKey: "dates")
        
        // 保存完了メッセージの表示
        let alert: UIAlertController = UIAlertController(title: "追加", message: "一句詠みました", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // 保存後に前の画面に戻る
            //self.navigationController?.popViewController(animated: true)
//            let viewController = ReadDiaryViewController() // インスタンスを作成
//            self.navigationController?.pushViewController(viewController, animated: true)
            
            self.performSegue(withIdentifier: "ReadDiary",sender: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}
