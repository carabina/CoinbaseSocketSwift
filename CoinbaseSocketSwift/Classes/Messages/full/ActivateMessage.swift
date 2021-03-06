//
//  ActivateMessage.swift
//  CoinbaseSocketSwift
//
//  Created by Hani Shabsigh on 10/29/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

open class ActivateMessage: ProductMessage {
    
    public let timestamp: Date
    public let userId: String
    public let profileId: String
    public let orderId: String
    public let stopType: String
    public let side: OrderSide
    public let stopPrice: Double
    public let size: Double
    public let funds: Double
    public let takerFeeRate: Double
    public let privateUpdate: Bool
    
    public required init(json: [String: Any]) throws {
        
        guard let timestamp = (json["timestamp"] as? String)?.dateFromISO8601 else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("timestamp")
        }
        
        guard let userId = json["user_id"] as? String else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("user_id")
        }
        
        guard let profileId = json["profile_id"] as? String else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("profile_id")
        }
        
        guard let orderId = json["order_id"] as? String else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("order_id")
        }
        
        guard let stopType = json["stop_type"] as? String else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("stop_type")
        }
        
        guard let side = OrderSide(rawValue: json["side"] as? String ?? "") else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("side")
        }
        
        guard let stopPrice = Double(json["stop_price"] as? String ?? "") else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("stop_price")
        }
        
        guard let size = Double(json["size"] as? String ?? "") else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("size")
        }
        
        guard let funds = Double(json["funds"] as? String ?? "") else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("funds")
        }
    
        
        guard let takerFeeRate = Double(json["taker_fee_rate"] as? String ?? "") else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("taker_fee_rate")
        }
        
        guard let privateUpdate = json["private"] as? Bool else {
            throw CoinbaseSocketSwiftError.responseParsingFailure("private")
        }
        
        self.timestamp = timestamp
        self.userId = userId
        self.profileId = profileId
        self.orderId = orderId
        self.stopType = stopType
        self.side = side
        self.stopPrice = stopPrice
        self.size = size
        self.funds = funds
        self.takerFeeRate = takerFeeRate
        self.privateUpdate = privateUpdate
        
        try super.init(json: json)
    }
}
