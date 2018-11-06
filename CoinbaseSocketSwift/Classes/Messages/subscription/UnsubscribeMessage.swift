//
//  UnsubscribeMessage.swift
//  CoinbaseSocketSwift
//
//  Created by Hani Shabsigh on 10/29/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

open class UnsubscribeMessage: SubscriptionMessage, JSONConvertible {
    
    open func asJSON() -> [String : Any] {
        return subscribeJSON(type: .unsubscribe, channels: self.channels, productIds: self.productIds)
    }
}
