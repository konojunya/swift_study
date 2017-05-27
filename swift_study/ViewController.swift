//
//  ViewController.swift
//  swift_study
//
//  Created by konojunya on 2017/05/27.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var items: [String] = [
        "apple","orange","banana"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        // セレクトできないものをつくる
        if indexPath.row == 1 {
            cell.selectionStyle = .none
        }
        
        return cell
        
    }

}

