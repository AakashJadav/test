//
//  UsersModel.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import Foundation

struct Post : Decodable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
}
