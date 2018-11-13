//
//  tableViewController.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import UIKit


let identifier = "LabelCell"

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTransaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: CellMainTableView! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellMainTableView
        
        if cell == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellMainTableView
        }
        var date = ((self.listTransaction as NSArray?)?[indexPath.row] as! NSDictionary)
        
        
        
        cell.item = ((self.listTransaction as NSArray?)?[indexPath.row] as! NSDictionary?)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0
    }
    
}
