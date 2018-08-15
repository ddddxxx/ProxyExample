//
//  TableViewController.swift
//  ProxyExample
//
//  Created by noctis on 2018/8/15.
//  Copyright © 2018年 ddddxxx. All rights reserved.
//

import UIKit

private let reuseID = "reuseID"

class TableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) ??
            UITableViewCell(style: .default, reuseIdentifier: reuseID)
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }
}
