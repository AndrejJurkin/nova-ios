//
//  Copyright 2017 Andrej Jurkin.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//
//  Ticker.swift
//  Nova
//
//  Created by Andrej Jurkin on 9/3/17.
//

import Foundation
import EVReflection
import RealmSwift

class CoinMarketCapTicker: RealmObject {
    
    // Realm primary key
    dynamic var symbol: String = ""
    
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var rank: Int = 0
    dynamic var priceUsd: Double = 0
    dynamic var priceBtc: Double = 0
    dynamic var dailyVolume: Double = 0
    dynamic var marketCapUsd: Double = 0
    dynamic var availableSupply: Double = 0
    dynamic var totalSupply: Double = 0
    dynamic var changeLastHour: Float = 0
    dynamic var changeLastDay: Float = 0
    dynamic var changeLastWeek: Float = 0
    dynamic var lastUpdated: Double = 0
    
    dynamic var isPinned = false
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
    
    func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [
            (keyInObject: "dailyVolume", keyInResource: "24h_volume_usd"),
            (keyInObject: "changeLastHour", keyInResource: "percent_change_1h"),
            (keyInObject: "changeLastDay", keyInResource: "percent_change_24h"),
            (keyInObject: "changeLastWeek", keyInResource: "percent_change_7d"),
            
            // Ignored
            (keyInObject: "isPinned", keyInResource: nil)
        ]
    }
    
    /// Update Realm with dictionary to prevent from overwriting ignored properties
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "symbol": symbol,
            "name": name,
            "rank": rank,
            "priceUsd": priceUsd,
            "priceBtc": priceBtc,
            "dailyVolume": dailyVolume,
            "marketCapUsd": marketCapUsd,
            "availableSupply": availableSupply,
            "totalSupply": totalSupply,
            "changeLastHour": changeLastHour,
            "changeLastDay": changeLastDay,
            "changeLastWeek": changeLastWeek,
            "lastUpdated": lastUpdated,
        ]
    }
}
