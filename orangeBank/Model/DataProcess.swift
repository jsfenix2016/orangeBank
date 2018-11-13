//
//  DataProcess.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation

struct DataProcess {
    
    static func processing(type: String, completionHandler: @escaping (_ tran: Data?)  -> Void) {
        guard let url = URL(string: type) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error)  in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler(nil)
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                completionHandler(data)
            }
        }).resume()
    }
}
