import UIKit

class WriteDiaryCollectionViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var fronts: [String] = []
    var middles: [String] = []
    var lasts: [String] = []
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // UserDefaultsにデフォルト値を登録
        saveData.register(defaults: ["fronts": [], "middles": [], "lasts": [], "contents": []])

        // UserDefaultsからデータを安全に取得
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

        collectionView.dataSource = self

        // レイアウト設定
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    // セクション内のアイテム数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fronts.count
    }
    
    // セルの内容を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        // UIListContentConfigurationでセルのテキストを設定
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = fronts[indexPath.item]
        contentConfiguration.secondaryText = contents[indexPath.item]
        
        // セルにコンテンツを設定
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
