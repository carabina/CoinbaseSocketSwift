//
//  CBSSDone.swift
//  CBSSSocketSwift
//
//  Created by Hani Shabsigh on 10/29/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

open class CBSSDone: CBSSProductSequenceTimeMessage {
    
    public let orderId: String
    public let price: Double?
    public let remainingSize: Double?
    public let side: CBSSSide
    public let reason: String
    
    public required init(json: [String: Any]) throws {
        
        guard let orderId = json["order_id"] as? String else {
            throw CBSSError.responseParsingFailure("order_id")
        }
        
        let price = Double(json["price"] as? String ?? "")
        
        let remainingSize = Double(json["remaining_size"] as? String ?? "")
        
        guard let side = CBSSSide(rawValue: json["side"] as? String ?? "") else {
            throw CBSSError.responseParsingFailure("side")
        }
        
        guard let reason = json["reason"] as? String else {
            throw CBSSError.responseParsingFailure("reason")
        }
        
        self.orderId = orderId
        self.remainingSize = remainingSize
        self.price = price
        self.side = side
        self.reason = reason
        
        try super.init(json: json)
    }
}
