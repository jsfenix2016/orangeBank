//
//  MainService.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation


class MainService: IMainService {
    
    
    func hardProcessingMain(completion:@escaping (_ tran: [Any]?) -> Void){
        
        DataProcess.processing(type: Constants.url.BaseApi) {[weak self] result in
            do {
                if let result = result{
                    let jsonResult = try! JSONSerialization.jsonObject(with: result as Data, options: []) as! NSArray
                    
                    var sortList = ((jsonResult ).sortedArray(using: [
                        NSSortDescriptor(key: "date", ascending: false)]))
                    
                    
                    
                    DispatchQueue.main.async {
                        
                        completion(sortList)
                    }
                }
            }
            catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                completion(nil)
            }
        }
    }
}
