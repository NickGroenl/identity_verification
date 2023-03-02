//
//  IdentityVerificationSDKTests.swift
//  identity_verification_flutter_tests
//
//  Created by Belinda Natividad on 7/28/22.
//

import XCTest
@testable import identity_verification_flutter

class IdentityVerificationSDKTests: XCTestCase {

    var idvSdk: IdentityVerificationSDK!

     override func setUp() {
        idvSdk = IdentityVerificationSDK()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStartIdentityVerification() throws {
        
        let scanStep = DocumentScanStep.make(
            with: ScanStep.blinkId,
            androidLicenseFileName: nil,
            iOSLicense: "abcd1234",
            showDocumentImages: true,
            documentFields: [],
            hiddenDocumentFields: nil,
            attachDocumentListener: nil,
            documentFilter: nil,
            skipUnsupportedBack: nil,
            showResultHeader: nil)
        
        let livenessStep = LivenessStep.makeWithInitialize(inProduction: NSNumber(booleanLiteral: false), liveness: Liveness.facetec, options:nil)
        
        let verificationServiceSettings = VerificationServiceSettings.make(
            withUrl: "https://www.example3.com",
            requestTimeout: RequestTimeout.make(
                withConnectionTimeout: 12,
                writeTimeout: 14,
                readTimeout: 1,
                timeoutIntervalForRequest: 1,
                timeoutIntervalForResource: 1),
            headers: ["header1": "value12", "header2":"value23"],
            publicKeyPins: ["pin1", "pin2"],
            isUsingSelfSignedCertificate: NSNumber(booleanLiteral: false))
        
        let config = IdvConfiguration.make(with: scanStep, livenessStep: livenessStep, verificationServiceSettings: verificationServiceSettings, dateFormat: nil, disableScreenshots: nil)
        
        idvSdk.startIdentityVerification(config: config)
        
        XCTAssert(scanStep.iOSLicense != nil)
        XCTAssert(livenessStep.initializeInProduction != nil)
        XCTAssert(verificationServiceSettings.url != "")
    }

}
