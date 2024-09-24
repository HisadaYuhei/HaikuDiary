import UIKit

class WriteDiaryCollectionViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var fronts: [String] = []
    var middles: [String] = []
    var lasts: [String] = []
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTestButton()

        // UserDefaultsにデフォルト値を登録
        saveData.register(defaults: ["fronts": [], "middles": [], "lasts": [], "contents": []])

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

        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DiaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiaryCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 20 , height: 224)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 12)
        collectionView.collectionViewLayout = layout

        // レイアウト設定
//        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressAction))
            longPressRecognizer.allowableMovement = 10
            longPressRecognizer.minimumPressDuration = 1
            collectionView.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func onLongPressAction(sender: UILongPressGestureRecognizer) {
            let point: CGPoint = sender.location(in: self.collectionView)
            let indexPath = self.collectionView.indexPathForItem(at: point)
            if let indexPath = indexPath {
                switch sender.state {
                case .began:
                    print("Long press began at: \(indexPath)")
                default:
                    break
                    
//                let vc = WriteDiaryViewController.instantiate()
//                            let tableListDic = tables.sorted {
//                                (s1, s2) -> Bool in
//                                s1.name.localizedStandardCompare(s2.name) == .orderedAscending
                }
//                vc.table = tableListDic[indexPath.row]
//                            navigationController?.pushViewController(vc, animated: true)
            }
        }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        contextMenuConfigurationForItemAt indexPath: IndexPath,
//                        point: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
//            let deleteAction = self.deleteAction(indexPath)
//            return UIMenu(title: "", children: [deleteAction])
//        }
//    }
    
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
//                                    configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(identifier: nil,
//                                          previewProvider: nil,
//                                          actionProvider: { suggestedActions in
//            let saveAction = UIAction(title: NSLocalizedString("Save", comment: ""),
//                                      image: UIImage(systemName: "arrow.down.square")) { action in
//                                 self.performSave()
//                             }
//                    
//            let deleteAction = UIAction(title: NSLocalizedString("Delete", comment: ""),
//                                        image: UIImage(systemName: "trash"),
//                                        attributes: .destructive) { action in
//                                   self.performDelete()
//                               }
//                                                
//            return UIMenu(title: "Select Action", children: [saveAction, deleteAction])
//        })
//    }


    
//    func performDelete(_ indexPath: IndexPath) -> UIAction {
//        return UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
//            // コレクションビューのデータソースからアイテムを削除する処理
//            self.fronts.remove(at: indexPath.row)
//            self.middles.remove(at: indexPath.row)
//            self.lasts.remove(at: indexPath.row)
//            self.contents.remove(at: indexPath.row)
//            self.collectionView.deleteItems(at: [indexPath])
//        }
//    }


    
    // セクション内のアイテム数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fronts.count
    }
    
    // セルの内容を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as! DiaryCollectionViewCell

        // UIListContentConfigurationでセルのテキストを設定
//        var contentConfiguration = UIListContentConfiguration.cell()
//        contentConfiguration.text = fronts[indexPath.item]
//        contentConfiguration.secondaryText = contents[indexPath.item]
        
        
//        cell.contentConfiguration = contentConfiguration
        cell.frontLabel.text = fronts[indexPath.item]
        cell.middleLabel.text = middles[indexPath.item]
        cell.lastLabel.text = lasts[indexPath.item]
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let width = collectionView.frame.width / 3 - 1 // 横幅を3分の1にする。-1は隙間調整用。
//            return CGSize(width: width, height: width) // 正方形にする場合
//        }
    
    //func
    
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
