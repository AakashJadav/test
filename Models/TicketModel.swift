//
//  TicketModel.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import Foundation


struct tickets : Decodable {
    let users : String?
    let message : String?
    let ticketList : [ticketList?]
}

struct ticketList : Decodable {
    let ticketId : String?
    let ticketName : String?
    let productName : String?
    let imageUrlList : String?
    let city : String?
    let location : String?
    let price : Float?
    let isFavourite : Int?
    let averageRating : Int?
    let userRating : Int?
    let purchaseCount : Int?
    let date : String?
    let durationString : String?
}
