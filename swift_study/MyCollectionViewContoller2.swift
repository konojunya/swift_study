//
//  MyCollectionViewContoller2.swift
//  swift_study
//
//  Created by konojunya on 2017/05/27.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit

class MyCollectionViewControlelr2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,MyCollectionViewCellDelegate{
    
    var collectionView: UICollectionView?
    
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
        ],
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
        ],
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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CollectionViewの練習"
        
        self.collectionView = {
            
            let cvLayout = UICollectionViewFlowLayout()
            cvLayout.itemSize = CGSize(
                width: (self.view.bounds.width - 20) / 2,
                height: (self.view.bounds.width - 20) / 2
            )
            cvLayout.minimumLineSpacing = 0
            cvLayout.minimumInteritemSpacing = 0
            cvLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            let collectionView = UICollectionView(frame: self.view.bounds,collectionViewLayout: cvLayout)
            collectionView.backgroundColor = UIColor.white
            collectionView.autoresizingMask = [
                .flexibleWidth
            ]
            self.view.addSubview(collectionView)
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
            
            return collectionView
            
        }()
    
    }
    
    // MARK: - CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let cell = cell as? MyCollectionViewCell {
            cell.item = self.items[indexPath.row]
            cell.id = self.items[indexPath.row]["text"]
            cell.delegate = self
        }
        
        return cell        
    }
    
    func onPressButton(_ sender: MyCollectionViewCell){
        print(sender.id)
    }
    
}

protocol MyCollectionViewCellDelegate: class {
    func onPressButton(_ sender: MyCollectionViewCell)
}
extension MyCollectionViewCellDelegate {
    
    func onPressButton(_ sender: MyCollectionViewCell){
        print("push \(sender.id)")
    }
    
}

class MyCollectionViewCell: ColorTillCell {
    
    var button: UIButton?
    var id: String?
    weak var delegate: MyCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildView() {
        super.buildView()
        
        self.button = {
            let button = UIButton(type: .roundedRect)
            button.addTarget(self, action: #selector(self.onPressButton(_:)), for: .touchUpInside)
            button.setTitle("push!", for: .normal)
            self.addSubview(button)
            
            return button
        }()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.button?.frame = CGRect.make(0, 0, 100, 44)
    }
    
    func onPressButton(_ sender: Any){
        self.delegate?.onPressButton(self)
    }
    
}
