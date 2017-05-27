//
//  MyTabelViewController.swift
//  swift_study
//
//  Created by konojunya on 2017/05/27.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyTableViewCellDelegate {
    
    var tableView: UITableView!
    
    var items: [String] = [
        "apple","orange","banana"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableViewの練習"
        
        // let frame = CGRect.make(0,self.view.bounds.height / 2,self.view.bounds.width,self.view.bounds.height / 2)
        
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
        
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MyTableViewCell
            ?? MyTableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        cell.modelId = indexPath.row
        cell.delegate = self
        
        // セレクトできないものをつくる
        if indexPath.row == 1 {
            cell.selectionStyle = .none
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //MARK セルのイベント
    func onPressButton(_ sender: MyTableViewCell) {
        
        // nilじゃ駄目なときに書く
        guard let modelId = sender.modelId else { return }
        
        self.items.remove(at: modelId)
        
        tableView.reloadData()
        
        //tableView.reloadData()
        
        //let section = IndexSet(integer: 0)
        //tableView.reloadSections(section, with: .fade)
        
        //let deleteIndexPath = NSIndexPath(row: sender.modelId!, section: 0) as IndexPath
        //tableView.deleteRows(at: [deleteIndexPath], with: .fade)
        //tableView.reloadData()
        
    }
    
}

// MARK: - MyTableViewCell
protocol MyTableViewCellDelegate: class {
    func onPressButton(_ sender: MyTableViewCell)
}
extension MyTableViewCellDelegate {
    
    func onPressButton(_ sender: MyTableViewCell){
        print("push \(sender.modelId)")
    }
    
}


class MyTableViewCell: UITableViewCell {
    
    var button: UIButton?
    var modelId: Int?
    weak var delegate : MyTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.buildView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView(){
        
        let button = UIButton(type: .roundedRect)
        button.addTarget(self, action: #selector(self.onPressButton(_:)), for: .touchUpInside)
        button.setTitle("Push", for: .normal)
        self.addSubview(button)
        self.button = button
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.button?.frame = CGRect.make(0,0,300,44)
    }
    
    func onPressButton(_ sender: Any){
        self.delegate?.onPressButton(self)
    }
    
}
