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

    override func viewDidLoad() {
        super.viewDidLoad()
        // デフォルトの値を登録
        saveData.register(defaults: ["fronts": [], "middles": [], "lasts": [], "contents": []])
        
        // UserDefaultsから保存されたデータを読み込む（安全にキャスト）
        if let savedFronts = saveData.object(forKey: "fronts") as? [String] {
            fronts = savedFronts
        }
        
        if let savedMiddles = saveData.object(forKey: "middles") as? [String] {
            middles = savedMiddles
        }
        
        if let savedLasts = saveData.object(forKey: "Lasts") as? [String] {
            lasts = savedLasts
        }
        
        if let savedContents = saveData.object(forKey: "contents") as? [String] {
            contents = savedContents
        }

        frontTextField.delegate = self
        middleTextField.delegate = self
        lastTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // キーボードを閉じる
        return true
    }
    
    @IBAction func save(_ sender: Any) {
        guard let front = frontTextField.text, !front.isEmpty,
              let middle = middleTextField.text, !middle.isEmpty,
              let last = lastTextField.text, !last.isEmpty,
              let content = contentTextView.text, !content.isEmpty else {
            // タイトルまたは内容が空の場合、エラーメッセージを表示
            let alert = UIAlertController(title: "エラー", message: "タイトルまたは内容が空です。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // タイトルと内容を配列に追加
        fronts.append(front)
        middles.append(middle)
        lasts.append(last)
        contents.append(content)
        
        // UserDefaultsに保存（配列全体を保存）
        saveData.set(fronts, forKey: "fronts")
        saveData.set(middles, forKey: "middles")
        saveData.set(lasts, forKey: "lasts")
        saveData.set(contents, forKey: "contents")
        
        // 保存完了メッセージの表示
        let alert: UIAlertController = UIAlertController(title: "追加", message: "Todoの追加が完了しました。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // 保存後に前の画面に戻る
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}
