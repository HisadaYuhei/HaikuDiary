import UIKit

class WriteDiaryCollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var fronts: [String] = []
    var middles: [String] = []
    var lasts: [String] = []
    var contents: [String] = []
    
    var dates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTestButton()

        // UserDefaultsにデフォルト値を登録
        saveData.register(defaults: ["fronts": [], "middles": [], "lasts": [], "contents": [], "dates": []])

        // UserDefaultsからデータを安全に取得
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DiaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiaryCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 20 , height: 224)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 12)
        collectionView.collectionViewLayout = layout
    }
    
    // セクション内のアイテム数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fronts.count
    }
    
    // セルの内容を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as! DiaryCollectionViewCell
        
        let frontText: String = fronts[indexPath.item]
        let middleText: String = middles[indexPath.item]
        let lastText: String = lasts[indexPath.item]
        
        let dateText: String = dates[indexPath.item]
        
        cell.setUp(frontText: frontText, middleText: middleText, lastText: lastText, dateText: dateText)
        
//        let interaction = UIContextMenuInteraction(delegate: self)
//        cell.addInteraction(interaction)
        
        return cell
    }
    
//    // Cell が選択された場合
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        // セルを取得するが、この場合再利用せず、実際に選択されたセルを取得したいなら dequeue ではなく cellForItem を使う
//        guard let cell = collectionView.cellForItem(at: indexPath) as? DiaryCollectionViewCell else {
//            return
//        }
//        
//        // fronts, middles, lasts, dates からデータを取得
//        let frontText: String = fronts[indexPath.item]
//        let middleText: String = middles[indexPath.item]
//        let lastText: String = lasts[indexPath.item]
//        let dateText: String = dates[indexPath.item]
//        
//        // frontText が空でないことをチェック
//        if !frontText.isEmpty, !middleText.isEmpty, !lastText.isEmpty, !dateText.isEmpty {
//            // SubViewController へ遷移するために Segue を呼び出す
//            performSegue(withIdentifier: "toReadPastViewController", sender: nil)
//        }
//    }
//
//    
//    // Segue 準備
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        if segue.identifier == "toReadPastViewController" {
//                // SubViewController へのキャストが正しく行われているか確認
//            if segue.destination is ReadPastViewController {
//                    // 必要に応じて、destinationVCにデータを渡す
//                }
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(actionProvider: { suggestedActions in
//            if indexPaths.count == 0 {
//                // Construct an empty-space menu.
//                return UIMenu(children: [
//                    UIAction(title: "New Folder") { _ in /* Implement the action. */ }
//                ])
//            }
//            else if indexPaths.count == 1 {
//                // Construct a single-item menu.
//                return UIMenu(children: [
//                    UIAction(title: "Copy") { _ in /* Implement the action. */ },
//                    UIAction(title: "Delete", attributes: .destructive) { _ in /* Implement the action. */ }
//                ])
//            }
//            else {
//                // Construct a multiple-item menu.
//                return UIMenu(children: [
//                    UIAction(title: "New Folder With Selection") { _ in /* Implement the action. */ }
//                ])
//            }
//        })
//    }
    
    // セルが選択された時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("セルが選択されました: \(indexPath.row)")
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        print("Selected indexPath: \(indexPath)")
    }

    // コンテキストメニューの設定
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let deleteAction = UIAction(title: "削除", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                print("削除が選択されました")
                // 削除処理を実行
                self.fronts.remove(at: indexPath.row)
                self.middles.remove(at: indexPath.row)
                self.lasts.remove(at: indexPath.row)
                self.contents.remove(at: indexPath.row)
                self.dates.remove(at: indexPath.row)
                
                // UserDefaultsにデータを保存
                self.saveData.set(self.fronts, forKey: "fronts")
                self.saveData.set(self.middles, forKey: "middles")
                self.saveData.set(self.lasts, forKey: "lasts")
                self.saveData.set(self.contents, forKey: "contents")
                self.saveData.set(self.dates, forKey: "dates")
                
                self.collectionView.deleteItems(at: [indexPath])
            }
            
            return UIMenu(title: "", children: [deleteAction])
        }
    }

    
//    // メニューを表示するための関数
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//            
//        // 押されたセルのインデックスを取得
//        guard let indexPath = collectionView.indexPathForItem(at: location),
//              let cell = collectionView.cellForItem(at: indexPath) else {
//            return nil
//        }
//        
//        //print("Location in collectionView: \(WriteDiaryCollectionViewController())")
//        print("Selected indexPath: \(indexPath)")
//
//            
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
//            // メニューのアクションを定義
////            let editAction = UIAction(title: "編集", image: UIImage(systemName: "pencil")) { _ in
////                print("編集が選択されました")
////                // 編集処理を実行
////            }
//            
//            let deleteAction = UIAction(title: "削除", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
//                print("削除が選択されました")
//                // 削除処理を実行
//                self.fronts.remove(at: indexPath.row)
//                self.middles.remove(at: indexPath.row)
//                self.lasts.remove(at: indexPath.row)
//                self.contents.remove(at: indexPath.row)
//                self.dates.remove(at: indexPath.row)
//                
//                // UserDefaultsにデータを保存
//                self.saveData.set(self.fronts, forKey: "fronts")
//                self.saveData.set(self.middles, forKey: "middles")
//                self.saveData.set(self.lasts, forKey: "lasts")
//                self.saveData.set(self.contents, forKey: "contents")
//                self.saveData.set(self.dates, forKey: "dates")
//                
//                self.collectionView.deleteItems(at: [indexPath])
//            }
//            
////            return UIMenu(title: "", children: [editAction, deleteAction])
//            return UIMenu(title: "", children: [deleteAction])
//        }
//    }
        
//    // メニュー表示中にハイライトされるプレビューのカスタマイズ
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
//        return nil
//    }
//        
//    // メニューが閉じられた時の処理
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
//        print("メニューが閉じられました")
//    }
    
    func configureTestButton() {
        //ボタンを丸くする処理．ボタンが正方形の時，一辺を2で割った数値を入れる(ボタンのサイズは70×70であるので35)
        testButton.layer.cornerRadius = 60
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
