//
//  MockBaseNetworking.swift
//  FactsAppTests
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
@testable import FactsApp

class MockBaseNetworking<TYPE: URLSession>: BaseNetworking{
    var success = TYPE()
    override var session: URLSession?{ get { return success }
        set{
            self.session = success
        }
    }
    
    override init() {
    }
    
    
}
