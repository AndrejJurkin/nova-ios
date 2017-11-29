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
//  CoinMarketCapProvider.swift
//  Nova
//
//  Created by Andrej Jurkin on 9/3/17.
//

import Foundation
import Moya

/// Moya provider that provides access to the CoinMarketCap public API
enum CoinMarketCapProvider {
    
    /// Get all available cryptocurrencies, sorted by market cap
    /// Convert prices to the target currency
    case allTickers(targetCurrency: String)
    
    /// Get top N cryptucurrencies, sorted by market cap
    case topTickers(limit: Int)
    
    /// Get ticker with name
    case ticker(currencyName: String)
}

extension CoinMarketCapProvider: TargetType {
    
    var baseURL: URL {
        return C.coinMarketCapBaseUrl
    }
    
    var path: String {
        switch self {
        case .allTickers:
            return "ticker"
        case .topTickers:
            return "ticker"
        case .ticker(let currencyName):
            return "ticker/\(currencyName)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .topTickers(let limit):
            return ["limit": limit]
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }
}
