//
//  identity_verification_flutter_tests.swift
//  identity_verification_flutter_tests
//
//  Created by Belinda Natividad on 7/28/22.
//

import XCTest
@testable import identity_verification_flutter

class identity_verification_flutter_tests: XCTestCase {
    
    var plugin: SwiftIdentityVerificationFlutterPlugin?
        
    override func setUp() {
        plugin = SwiftIdentityVerificationFlutterPlugin()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
