//
//  UserModel.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import Foundation

struct UserDetails : Decodable {
    
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let address : address?
    let phone : String?
    let website : String?
    let company : company?
}

struct address : Decodable {
    
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : geo?
}

struct geo : Decodable {
    
    let lat : String?
    let lng : String?
}

struct company : Decodable {
    
    let name : String?
    let catchPhrase : String?
    let bs : String?
}
