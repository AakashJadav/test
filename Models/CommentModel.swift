//
//  CommentModel.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import Foundation

struct Comments : Decodable {
    
    let postId : Int?
    let id : Int?
    let name : String?
    let email : String?
    let body : String?
    
}
