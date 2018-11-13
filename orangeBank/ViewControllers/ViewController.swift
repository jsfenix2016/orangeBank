//
//  ViewController.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import UIKit

enum NSComparisonResult : Int {
    case OrderedAscending
    case OrderedSame
    case OrderedDescending
}

fileprivate var tableViewCell = "LabelCell"
class ViewController: UIViewController {
    
    var listTransaction  = [Any]()
    @IBOutlet weak var tblTransaction: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblTransaction.register(UINib(nibName: "CellMainTableView", bundle: nil), forCellReuseIdentifier: tableViewCell)
        
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                MainService.init().hardProcessingMain(completion: {[weak self] (transaction ) in
                    if let result = transaction{
                        self?.listTransaction = result
                        self!.removeDateIncorrect(list:result)
                        
                        
                        self?.tblTransaction.reloadData()
                    }
                })
            }
        }
    }
    
    func removeDateIncorrect(list: [Any])
    {
        var listRemoved = [Int]()
        for (index) in list.indices {
            let dic = list[index] as! NSDictionary
            
            let string = dic["date"] as! String
            let dateonly = (string.components(separatedBy: "T"))[0]
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-mm-dd"
            dateformatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
            let date = dateformatter.date(from: dateonly)
            
            if date == nil {
                listRemoved.insert(index, at: 0)
            }
        }
        
        for (animalName) in listRemoved.indices {
            [self.listTransaction .remove(at: listRemoved[animalName])]
        }
        
    }
    
    
}

