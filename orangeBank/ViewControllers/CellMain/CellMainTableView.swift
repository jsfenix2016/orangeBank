//
//  CellMainTableView.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import UIKit

class CellMainTableView: UITableViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblFee: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var incomeDischarge: UIView!
    
    @IBOutlet weak var total: UILabel!
    var amount: Double!
    var fee: Double!
    
    var item: NSDictionary! {
        didSet{
            guard let item = item else {
                return
            }
            
            let dateonly = ((item["date"] as! String).components(separatedBy: "T"))[0]
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-mm-dd"
            dateformatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
            let date = dateformatter.date(from: dateonly)
            
            if date != nil {
                self.lblDate?.text = "Date: \(String(describing:  date!))"
            }
            else{
                self.lblDate?.text = "no date "
            }
            
            self.amount = (item["amount"] as! Double)
            self.lblAmount?.text = "amount: \(String(describing: self.amount!)) €"
            
            incomeDischarge(valor: self.amount)
            
            self.fee = (item["fee"] as? Double)
            
            let _fee = ((item["fee"] as? Double) != nil ? String(describing:(item["fee"] as? Double)) : "")
            
            self.lblFee?.text = "Fee: \(String(describing: _fee)) €"
            
            let description =  item["description"] as? String != nil ? item["description"] as? String : ""
            
            self.lblDescription?.text = "Description: \(description!) "
            
            var total: Double = 0.0
            if self.fee != nil , self.amount != nil {
                total = self.amount + self.fee
            }else{
                total = self.amount
            }
            self.total?.text = "Total: \(String(describing: total)) €"
        }
    }
    
    func incomeDischarge(valor: Double) {
        if valor < 0 {
            self.total?.backgroundColor = UIColor.red
        }else{
            self.total?.backgroundColor = UIColor.green
        }
    }
}
