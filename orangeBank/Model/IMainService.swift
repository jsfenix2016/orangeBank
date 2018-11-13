//
//  IMainService.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation

protocol IMainService {
    
    func hardProcessingMain(completion:@escaping (_ tran: [Any]?) -> Void)
}
