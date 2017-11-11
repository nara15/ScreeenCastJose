//
//  MUser.swift
//  ScreenCastJose
//
//  Created by Mario Naranjo Leiva on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import ObjectMapper

struct MUser: Mappable{
    
    var username: String?
    var firstname: String?
    var lastname: String?
    var email: String?
    var code: Int = 0
    
    init(){}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        firstname <- map["name"]
        lastname <- map["lastname"]
        email <- map["email"]
        code <- map["code"]
    }
    
    

    
    
    
    //  Logout user. It just reset the user values to empty.
    mutating func logout()
    {
        username = ""
        firstname = ""
        lastname = ""
        email = ""
    }
    
}
