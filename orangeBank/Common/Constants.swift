//
//  Constants.swift
//  orangeBank
//
//  Created by test on 13/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation

struct Constants {
    struct url {
        static let BaseApi: String = "https://api.myjson.com/bins/1a30k8"
    }
    
    var responseMessages = [200: "OK",
                            403: "Access forbidden",
                            404: "File not found",
                            500: "Internal server error"]
}
