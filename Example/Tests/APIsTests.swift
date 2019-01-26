//
//  APIsTests.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import iOS_Bootstrap

class APIsTests: XCTestCase {

    private var networkingProvider: StubedAPIsConnector!

    override func setUp() {
        super.setUp()
        networkingProvider = StubedAPIsConnector()
    }
    
    func testGetCountries() {
        let expectation = self.expectation(description: "Execute")
        let expectedResult = TestingHelpers.getbjectsFromData(type: Country.self, fileName: "Countries")! as! [Country]
        _ = networkingProvider
            .stubedRequest(api: .getWorldCountries())
            .map([Country].self)
            .subscribe({ result in
                switch result {
                case .success(let countries):
                    XCTAssertNotNil(countries)
                    XCTAssert(countries[0].capital == expectedResult[0].capital)
                case .error(let error):
                    XCTFail("did fail to get countries with error : \(error)")
                }
                expectation.fulfill()
            })
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
