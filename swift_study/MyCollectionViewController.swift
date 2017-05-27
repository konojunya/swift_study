//
//  MyCollectionViewController.swift
//  swift_study
//
//  Created by konojunya on 2017/05/27.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit

class MyCollectionViewControlelr: UICollectionViewController{
    
    var items : [[String: String]] = [
        [
            "text": "hoge",
            "color": "00ff00"
        ],
        [
            "text": "huga",
            "color": "dd00dd"
        ],
        [
            "text": "foo",
            "color": "aaaaaa"
        ],
        [
            "text": "bar",
            "color": "cccccc"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let collectionView = self.collectionView {
            
            // カスタムセルを登録する
            collectionView.register(ColorTillCell.self, forCellWithReuseIdentifier: "Cell")
            
            // MARK: - レイアウトを調整する
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(
                width: (self.view.bounds.width - 20) / 2,
                height: (self.view.bounds.width - 20) / 2
            )
            
            // 行数
            collectionViewLayout.minimumLineSpacing = 0
            
            // 要素間
            collectionViewLayout.minimumInteritemSpacing = 0
            
            // 全体の余白
            collectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            // レイアウトを指定する
            //collectionView.setCollectionViewLayout(collectionViewLayout, animated: false)
            collectionView.collectionViewLayout = collectionViewLayout
            
        }
        
    }
    
    // MARK: - CollectionView
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let cell = cell as? ColorTillCell {
            cell.item = self.items[indexPath.row]
        }
        
        return cell
        
    }
    
}

class ColorTillCell: UICollectionViewCell{
    
    var item : [String:String]? {
        didSet{
            self.onUpdate()
        }
    }
    var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView(){
        
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        self.addSubview(label)
        
        self.label = label

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.label?.frame = self.bounds
        
    }
    
    func onUpdate(){
        
        if let color = item?["color"]{
            self.backgroundColor = UIColor(hex: color)
        }
        
        if let title = item?["text"]{
            self.label?.text = title
        }
        
    }
    
}
