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
//  Injector.swift
//  Nova
//
//  Created by Andrej Jurkin on 9/3/17.

import Foundation
import Swinject
import Moya
import SwinjectAutoregistration

/// Swinject dependency injection wrapper
class Injector {
    
    private static let instance = Injector()
    
    /// App level dependencies, top level di container
    private let mainContainer = Container()
    
    private init() {
        self.registerGlobalDependencies()
        self.registerProviders()
        self.registerDataSources()
        self.registerViewModels()
    }
    
    /// Inject, resolve a dependency with the given type
    /// Throws exception if the given type can not be resolved
    public static func inject<T>(type: T.Type) -> T {
        return instance.mainContainer.resolve(type)!
    }
    
    // MARK: Global dependencies
    private func registerGlobalDependencies() {
        
        self.mainContainer.autoregister(Prefs.self, initializer: Prefs.init)
    }
    
    // MARK: Providers
    
    private func registerProviders() {
        
        self.mainContainer.register(RxMoyaProvider<CoinMarketCapProvider>.self) { _ in
            return RxMoyaProvider<CoinMarketCapProvider>()
        }
        
        self.mainContainer.register(RxMoyaProvider<CryptoCompareProvider>.self) { _ in
            return RxMoyaProvider<CryptoCompareProvider>()
        }
    }
    
    
    // MARK: Data sources
    
    /// All data sources should be registered in container object scope (singleton)
    private func registerDataSources() {
        
      
    }
    
    // MARK: View models
    
    private func registerViewModels() {
        

    }
}

